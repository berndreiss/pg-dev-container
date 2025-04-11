.PHONY: all bash reduce clean
all: cocci

cocci:
	@$(MAKE) --no-print-directory clean
	@echo "Running Coccinelle related scripts..." 
	@$(MAKE) --no-print-directory pfree
	@$(MAKE) --no-print-directory repalloc
	@$(MAKE) --no-print-directory pfree_same_return
	@$(MAKE) --no-print-directory char

pfree:
	@echo "Running script for pfree..."
	@cd scripts && bash runCocci.sh pfree
	@echo "##### RESULTS PFREE #####" >> results/pfree/results.log
	@cd scripts && bash reduceResults.sh pfree

repalloc:
	@echo "Running script for repalloc..."
	@cd scripts && bash runCocci.sh repalloc
	@echo "##### RESULTS REPALLOC #####" >> results/repalloc/results.log
	@cd scripts && bash reduceResults.sh repalloc

pfree_same_return:
	@echo "Running script for pfree_same_return..."
	@cd scripts && bash runCocci.sh pfree_same_return
	@echo "##### RESULTS PFREE WITH SAME RETURN TYPE #####" >> results/pfree_same_return/results.log
	@cd scripts && bash reduceResults.sh pfree_same_return

char:
	@echo "Running script for char..."
	@cd scripts && bash runCocci.sh char
	@echo "##### RESULTS CHAR #####" >> results/char/results.log
	@cd scripts && bash reduceResults.sh char

reduce:
	@echo "Running reducing scripts only..."
	@cd scripts && bash reduceResults.sh pfree
	@cd scripts && bash reduceResults.sh repalloc
	@cd scripts && bash reduceResults.sh pfree_same_return
	@cd scripts && bash reduceResults.sh char

print:
	@@if [ -f results/pfree/results.log ]; then cat results/pfree/results.log; fi
	@@if [ -f results/repalloc/results.log ]; then cat results/repalloc/results.log; fi
	@@if [ -f results/pfree_same_return/results.log ]; then cat results/pfree_same_return/results.log; fi
	@@if [ -f results/char/results.log ]; then cat results/char/results.log; fi

clean:
	@if [ "$$(ls -A results | wc -l)" -eq 0 ]; then echo "Nothing to clean"; else rm -r results/*; fi
	@rm -f scripts/*.tmp
