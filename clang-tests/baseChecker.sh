#!/bin/bash

# PostgresChecker Directory Analyzer Script 
# Usage: ./analyze_directory.sh [directory] [output_file]

DIRECTORY=${1:-"."}
# Generate output filename based on directory name
DIR_NAME=$(basename "$DIRECTORY")
TMP_DIR=PGtmp
# Replace . with current_directory for readability
if [ "$DIR_NAME" = "." ]; then
    DIR_NAME="current_directory"
fi
OUTPUT_FILE=${2:-"analysis_${DIR_NAME}_results.out"}

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
echo "Started: $(date)"
echo "========================================="

# Clear output file
> ../"$OUTPUT_FILE"

# Write header to output file
{
    echo "PostgresChecker Static Analysis Results"
    echo "============================================================="
    echo "Directory: $ANALYSIS_DIR"
    echo "Path: $PG_PATH"
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
    
    echo "$includes"
}

# Function to check if checker library exists
check_checker_lib() {
    if [ -f "/usr/local/lib/libPostgresChecker.so" ]; then
        echo -e "${GREEN}✓ PostgreSQL checker library found${NC}"
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
        echo -e "${GREEN}  ✓ Analysis completed${NC}"
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
            echo -e "${GREEN}  ✓ Clean (no issues)${NC}"
        fi
    else
        echo -e "${RED}  ✗ Analysis failed${NC}"
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

