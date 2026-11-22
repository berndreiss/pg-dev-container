#!/bin/bash

# PostgresChecker Directory Analyzer Script
# Usage: ./baseChecker.sh [-I include_path] ... [directory] [output_file]

TMP_DIR=PGtmp

# PostgreSQL source path
if [ -z "${PG_PATH}" ]; then
    PG_PATH=/usr/local/src/postgresql
fi
if [ ! -d "$PG_PATH" ]; then
  echo "Need to set valid PG_PATH!"
  exit 1
fi
if [ ! -d "$TMP_DIR" ]; then
  mkdir "$TMP_DIR"
fi

# Parse command line options - collect include paths first
# Convert relative paths to absolute before we cd into TMP_DIR
CUSTOM_INCLUDES=""
while getopts "I:" opt; do
    case $opt in
        I)
            # Convert to absolute path if it exists
            if [ -d "$OPTARG" ]; then
                ABS_PATH=$(realpath "$OPTARG")
                CUSTOM_INCLUDES="$CUSTOM_INCLUDES -I$ABS_PATH"
            else
                # Keep as-is if path doesn't exist (let clang report the error)
                CUSTOM_INCLUDES="$CUSTOM_INCLUDES -I$OPTARG"
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: $0 [-I include_path] ... [directory] [output_file]"
            exit 1
            ;;
    esac
done

# Shift past the options to get positional parameters
shift $((OPTIND-1))

DIRECTORY=${1:-"."}
# Generate output filename based on directory name
DIR_NAME=$(basename "$DIRECTORY")
# Replace . with current_directory for readability
if [ "$DIR_NAME" = "." ]; then
    DIR_NAME="current_directory"
fi
OUTPUT_FILE=${2:-"analysis_${DIR_NAME}_results.out"}

# Get absolute path of the directory being analyzed
ANALYSIS_DIR=$(realpath "$DIRECTORY")

cd "$TMP_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "========================================="
echo "PostgreSQL Directory Analysis"
echo "========================================="
echo "Directory: $ANALYSIS_DIR"
echo "Output file: $OUTPUT_FILE"
echo "PostgreSQL path: $PG_PATH"
if [ -n "$CUSTOM_INCLUDES" ]; then
    echo "Custom includes: $CUSTOM_INCLUDES"
fi
echo "Started: $(date)"
echo "========================================="

# Create output directory if needed and clear output file
mkdir -p "$(dirname "../$OUTPUT_FILE")"
> ../"$OUTPUT_FILE"

# Write header to output file
{
    echo "PostgresChecker Static Analysis Results"
    echo "============================================================="
    echo "Directory: $ANALYSIS_DIR"
    echo "Path: $PG_PATH"
    if [ -n "$CUSTOM_INCLUDES" ]; then
        echo "Custom includes: $CUSTOM_INCLUDES"
    fi
    echo "Started: $(date)"
    echo "Clang version: $(clang-19 --version | head -1)"
    echo ""
} >> ../"$OUTPUT_FILE"

# Function to build include paths dynamically
build_include_paths() {
    local includes=""

    # Include server
    includes="$includes -I$(pg_config --includedir-server)"

    # Include client
    includes="$includes -I$(pg_config --includedir)"

    # Extension-specific includes
    if [ -d "$ANALYSIS_DIR/src/include" ]; then
        includes="$includes -I$ANALYSIS_DIR/src/include"
    fi

    # Additional backend includes
    if [ -d "$ANALYSIS_DIR/src/backend" ]; then
        includes="$includes -I$ANALYSIS_DIR/src/backend"
    fi

    # Try common build locations
    if [ -d "$ANALYSIS_DIR/../build" ]; then
        includes="$includes -I$ANALYSIS_DIR/../build"
        includes="$includes -I$ANALYSIS_DIR/../build/src"
    fi

    if [ -d "$ANALYSIS_DIR/src" ]; then
        includes="$includes -I$ANALYSIS_DIR/src"
    fi


    while IFS= read -r include_dir; do
    includes="$includes -I$include_dir"
done < <(find "$ANALYSIS_DIR" -type d -name "include")

    # Append custom includes passed via -I option
    includes="$includes $CUSTOM_INCLUDES"

    echo "$includes"
}

# Function to check if checker library exists
check_checker_lib() {
    if [ -f "/usr/local/lib/libPostgresChecker.so" ]; then
        echo -e "${GREEN}[OK] PostgreSQL checker library found${NC}"
        return 0
    else
        echo -e "${YELLOW}! PostgreSQL checker library not found at /usr/local/lib/libPostgresChecker.so${NC}"
        return 1
    fi
}

# Function to analyze a single file
analyze_file() {
    local file="$1"
    local temp_output="$2"
    local includes="$3"
    local use_checker="$4"
    
    clang-19 --analyze \
        $includes \
        -Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so \
        --analyzer-no-default-checks \
        -Xclang -analyzer-checker=postgres.PostgresChecker \
        "$file" > "$temp_output" 2>&1
}

# Main analysis
echo -e "${BLUE}Preparing analysis...${NC}"

# Build include paths
INCLUDE_PATHS=$(build_include_paths)
echo "Include paths: $INCLUDE_PATHS"

# Check for checker library
if check_checker_lib; then
    echo "Command: clang-19 --analyze $INCLUDE_PATHS -Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so --analyzer-no-default-checks -Xclang -analyzer-checker=postgres.PostgresChecker"
else
  echo "Checker lib has not been found."
  return 2;
fi

# Write command info to output file
{
    echo "Include paths: $INCLUDE_PATHS"
    echo "Using custom checker: $USE_CHECKER"
    echo "Command: clang-19 --analyze $INCLUDE_PATHS -Xclang -load -Xclang /usr/local/lib/libPostgresChecker.so --analyzer-no-default-checks -Xclang -analyzer-checker=postgres.PostgresChecker"
    echo ""
} >> "$OUTPUT_FILE"

# Counters
total_files=0
analyzed_files=0
failed_files=0
files_with_warnings=0

echo -e "${BLUE}Starting analysis...${NC}"

# Find and analyze all .c files
while IFS= read -r file; do
    ((total_files++))
    
    echo -e "${YELLOW}Analyzing ($total_files):${NC} $file"
    
    # Create temporary file for analysis output
    temp_output=$(mktemp)
    
    # Run analysis
    if analyze_file "$file" "$temp_output" "$INCLUDE_PATHS" "$USE_CHECKER"; then
        echo -e "${GREEN}  [OK] Analysis completed${NC}"
        ((analyzed_files++))
        
        # Check if there were any warnings or errors in the output
        if grep -q -E "(warning:|error:|note:)" "$temp_output"; then
            echo -e "${RED}  ! Issues found${NC}"
            ((files_with_warnings++))
            
            # Count different types of issues
            warnings=$(grep -c "warning:" "$temp_output" 2>/dev/null)
            errors=$(grep -c "error:" "$temp_output" 2>/dev/null)
            
            echo -e "${RED}    Errors: $errors, Warnings: $warnings"
            
            # Write file header and content to output file
            {
                echo "========================================"
                echo "File: $file"
                echo "Time: $(date)"
                echo "Status: ISSUES FOUND"
                echo "Errors: $errors, Warnings: $warnings"
                echo "========================================"
                cat "$temp_output"
                echo ""
            } >> ../"$OUTPUT_FILE"
        else
            echo -e "${GREEN}  [OK] Clean (no issues)${NC}"
        fi
    else
        echo -e "${RED}  [X] Analysis failed${NC}"
        ((failed_files++))
        cat "$temp_output"
        
        # Always write failed files to output
        #{
            #echo "========================================"
            #echo "File: $file"
            #echo "Time: $(date)"
            #echo "Status: ANALYSIS FAILED"
            #echo "========================================"
            #cat "$temp_output"
            #echo ""
        #} >> "$OUTPUT_FILE"
    fi
    
    # Clean up temporary file
    rm -f "$temp_output"
    
    # Progress update every 10 files
    if (( total_files % 10 == 0 )); then
        echo -e "${BLUE}Progress: $total_files files processed...${NC}"
    fi
done < <(find "$ANALYSIS_DIR" -name "*.c" -type f)

# Write summary to output file
{
    echo ""
    echo "========================================="
    echo "ANALYSIS SUMMARY"
    echo "========================================="
    echo "Completed: $(date)"
    echo "Total files found: $total_files"
    echo "Successfully analyzed: $analyzed_files"
    echo "Failed to analyze: $failed_files"
    echo "Files with warnings/errors: $files_with_warnings"
    #echo "Success rate: $(( analyzed_files * 100 / total_files ))%"
    echo "========================================="
} >> "$OUTPUT_FILE"

# Display summary
echo ""
echo "========================================="
echo -e "${GREEN}ANALYSIS COMPLETE${NC}"
echo "========================================="
echo "Total files found: $total_files"
echo "Successfully analyzed: $analyzed_files"
echo "Failed to analyze: $failed_files"
echo "Files with warnings/errors: $files_with_warnings"
#echo "Success rate: $(( analyzed_files * 100 / total_files ))%"
echo ""
echo "Results saved to: $OUTPUT_FILE"
echo ""

echo "========================================="

cd ..
rm -r "$TMP_DIR"

