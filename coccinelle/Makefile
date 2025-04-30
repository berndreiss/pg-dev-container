.PHONY: all bash reduce clean
all: cocci

cocci:
	@echo "Running Coccinelle related scripts..." 
	@$(MAKE) --no-print-directory freerealloc

freerealloc:
	@echo "Running script for free/realloc..."
	@cd scripts && bash runCocci.sh freerealloc
	@echo "##### RESULTS FREE / RELLOC #####" >> results/freerealloc/results.log
	@cd scripts && bash reduceResults.sh freerealloc

print:
	@@if [ -f results/pfree/results.log ]; then cat results/pfree/results.log; fi

clean:
	@if [ "$$(ls -A results | wc -l)" -eq 0 ]; then echo "Nothing to clean"; else rm -r results/*; fi
	@rm -f scripts/*.tmp
