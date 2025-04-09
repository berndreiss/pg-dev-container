.PHONY: all bash reduce clean
all: bash

bash:
	@echo "Running Coccinelle related scripts..."
	@$(MAKE) --no-print-directory pfree_repalloc
	@$(MAKE) --no-print-directory char

pfree_repalloc:
	@cd scripts && bash runCocci.sh pfree_repalloc
	@echo "##### RESULTS PFREE_REPALLOC #####"
	@cd scripts && bash reduceResults.sh pfree_repalloc

char:
	@cd scripts && bash runCocci.sh char
	@echo "##### RESULTS CHAR #####"
	@cd scripts && bash reduceResults.sh char

reduce:
	@echo "Running reducing scripts only..."
	@cd scripts && bash reduceResults.sh pfree_repalloc
	@cd scripts && bash reduceResults.sh char

clean:
	@rm -f results/*.out scripts/*.tmp
