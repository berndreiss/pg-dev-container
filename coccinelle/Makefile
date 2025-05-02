.PHONY: all bash reduce clean
all: cocci

cocci:
	@$(MAKE) --no-print-directory clean
	@echo "Running Coccinelle related scripts..." 
	@$(MAKE) --no-print-directory free
	@$(MAKE) --no-print-directory realloc
	@$(MAKE) --no-print-directory freestrict
	@$(MAKE) --no-print-directory reallocstrict
	@$(MAKE) --no-print-directory freesignature
	@$(MAKE) --no-print-directory reallocsignature
	@$(MAKE) --no-print-directory samereturn

free:
	@echo "Running script for free..."
	@cd scripts && bash runCocci.sh free ""
	@echo "##### RESULTS FREE #####" >> results/free/results.log
	@cd scripts && bash reduceResults.sh free

realloc:
	@echo "Running script for realloc..."
	@cd scripts && bash runCocci.sh realloc ""
	@echo "##### RESULTS REALLOC #####" >> results/realloc/results.log
	@cd scripts && bash reduceResults.sh realloc

freestrict:
	@echo "Running script for freestrict..."
	@cd scripts && bash runCocci.sh free "strict"
	@echo "##### RESULTS FREE STRICT #####" >> results/freestrict/results.log
	@cd scripts && bash reduceResults.sh freestrict

reallocstrict:
	@echo "Running script for reallocstrict..."
	@cd scripts && bash runCocci.sh realloc "strict"
	@echo "##### RESULTS REALLOC STRICT #####" >> results/reallocstrict/results.log
	@cd scripts && bash reduceResults.sh reallocstrict

freesignature:
	@echo "Running script for freesignature..."
	@cd scripts && bash runCocci.sh free "signature"
	@echo "##### RESULTS FREE SIGNATURE #####" >> results/freesignature/results.log
	@cd scripts && bash reduceResults.sh freesignature

reallocsignature:
	@echo "Running script for reallocsignature..."
	@cd scripts && bash runCocci.sh realloc "signature"
	@echo "##### RESULTS REALLOC SIGNATURE #####" >> results/reallocsignature/results.log
	@cd scripts && bash reduceResults.sh reallocsignature

samereturn:
	@cd scripts && bash runCocci.sh "samereturn"
	@echo "##### RESULTS SAMERETURN #####" >> results/samereturn/results.log
	@cd scripts && bash reduceResults.sh samereturn

print:
	@@if [ -f results/pfree/results.log ]; then cat results/pfree/results.log; fi

clean:
	@if [ "$$(ls -A results | wc -l)" -eq 0 ]; then echo "Nothing to clean"; else rm -r results/*; fi
	@rm -f scripts/*.tmp
	@rm -rf logs
