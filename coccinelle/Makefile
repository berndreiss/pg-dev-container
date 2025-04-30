.PHONY: all bash reduce clean
all: cocci

cocci:
	@echo "Running Coccinelle related scripts..." 
	@$(MAKE) --no-print-directory freerealloc
	@$(MAKE) --no-print-directory samereturn

freerealloc:
	@echo "Running script for free/realloc..."
	@cd scripts && bash runCocci.sh freerealloc
	@echo "##### RESULTS FREE / REALLOC #####" >> results/freerealloc/results.log
	@cd scripts && bash reduceResults.sh freerealloc

samereturn:
	@echo "Running script for same return type..."
	@cd scripts && bash runCocci.sh samereturn
	@echo "##### RESULTS FREE / RELLOC #####" >> results/samereturn/results.log
	@cd scripts && bash reduceResults.sh samereturn

print:
	@@if [ -f results/pfree/results.log ]; then cat results/pfree/results.log; fi

clean:
	@if [ "$$(ls -A results | wc -l)" -eq 0 ]; then echo "Nothing to clean"; else rm -r results/*; fi
	@rm -f scripts/*.tmp
