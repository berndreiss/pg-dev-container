.PHONY: all bash reduce clean
all: cocci

cocci:
	@echo "Running Coccinelle related scripts..."
	@$(MAKE) --no-print-directory pfree
	@$(MAKE) --no-print-directory repalloc
	@$(MAKE) --no-print-directory char

pfree:
	@cd scripts && bash runCocci.sh pfree
	@echo "##### RESULTS PFREE #####"
	@cd scripts && bash reduceResults.sh pfree

repalloc:
	@cd scripts && bash runCocci.sh repalloc
	@echo "##### RESULTS REPALLOC #####"
	@cd scripts && bash reduceResults.sh repalloc

char:
	@cd scripts && bash runCocci.sh char
	@echo "##### RESULTS CHAR #####"
	@cd scripts && bash reduceResults.sh char

reduce:
	@echo "Running reducing scripts only..."
	@cd scripts && bash reduceResults.sh pfree_repalloc
	@cd scripts && bash reduceResults.sh char

clean:
	@rm -r results/* 
	@rm -f scripts/*.tmp
