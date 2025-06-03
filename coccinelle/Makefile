.PHONY: all bash reduce clean
all: cocci

cocci:
	@$(MAKE) --no-print-directory clean
	@echo "Running Coccinelle related scripts..." 
	@$(MAKE) --no-print-directory freeall
	@$(MAKE) --no-print-directory reallocall
	@$(MAKE) --no-print-directory collect

freeall:
	@$(MAKE) --no-print-directory free
	@$(MAKE) --no-print-directory freestatic
	@$(MAKE) --no-print-directory freestrict
	@$(MAKE) --no-print-directory freesignature
	@$(MAKE) --no-print-directory freedependent
	@$(MAKE) --no-print-directory freeereport
	@$(MAKE) --no-print-directory freedouble

reallocall:
	@$(MAKE) --no-print-directory realloc
	@$(MAKE) --no-print-directory reallocstatic
	@$(MAKE) --no-print-directory reallocstrict
	@$(MAKE) --no-print-directory reallocsignature
	@$(MAKE) --no-print-directory reallocdependent
	@$(MAKE) --no-print-directory reallocereport
	@$(MAKE) --no-print-directory reallocdouble

free:
	@echo "Running script for free..."
	@cd scripts && bash runCocci.sh free ""

realloc:
	@echo "Running script for realloc..."
	@cd scripts && bash runCocci.sh realloc ""

freestatic:
	@echo "Running script for freestatic..."
	@cd scripts && bash runCocci.sh free "static"

reallocstatic:
	@echo "Running script for reallocstatic..."
	@cd scripts && bash runCocci.sh realloc "static"

freestrict:
	@echo "Running script for freestrict..."
	@cd scripts && bash runCocci.sh free "strict"

reallocstrict:
	@echo "Running script for reallocstrict..."
	@cd scripts && bash runCocci.sh realloc "strict"

freesignature:
	@echo "Running script for freesignature..."
	@cd scripts && bash runCocci.sh free "signature"

reallocsignature:
	@echo "Running script for reallocsignature..."
	@cd scripts && bash runCocci.sh realloc "signature"

freedependent:
	@echo "Running script for freedependent..."
	@cd scripts && bash runCocci.sh free "dependent"

reallocdependent:
	@echo "Running script for reallocdependent..."
	@cd scripts && bash runCocci.sh realloc "dependent"

freeereport:
	@echo "Running script for freeereport..."
	@cd scripts && bash runCocci.sh free "ereport"

reallocereport:
	@echo "Running script for reallocereport..."
	@cd scripts && bash runCocci.sh realloc "ereport"

freedouble:
	@echo "Running script for freedouble..."
	@cd scripts && bash runCocci.sh free "double"

reallocdouble:
	@echo "Running script for reallocdouble..."
	@cd scripts && bash runCocci.sh realloc "double"

collect:
	@cd scripts && bash collectResults.sh && bash formatLatex.sh

print:
	@@if [ -f results/pfree/results.log ]; then cat results/pfree/results.log; fi

clean:
	@if [ "$$(ls -A results | wc -l)" -eq 0 ]; then echo "Nothing to clean"; else rm -r results/*; fi
	@rm -f scripts/*.tmp
	@rm -rf logs
