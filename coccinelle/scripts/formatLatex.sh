#!/bin/bash

LATEX_FILE=../results/resultsLatex.tex

echo "\begin{table}[H]
   \begin{center}
   \begin{tabularx}{0.6\linewidth}{l|c|c}

      Category & Free & Realloc \\\\
      \hline
" > $LATEX_FILE

FREE=$(grep -A 1 "ALL:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "ALL:" ../results/reallocstats.out | tail -n 1)
echo "      All Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "SAME RETURN:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "SAME RETURN:" ../results/reallocstats.out | tail -n 1)
echo "      C1: Functions To Reassign& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^STRICT:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "^STRICT:" ../results/reallocstats.out | tail -n 1)
echo "      C2: Strict Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^DEPENDENT:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "^DEPENDENT:" ../results/reallocstats.out | tail -n 1)
echo "      C3: Dependent Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^EREPORT:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "^EREPORT:" ../results/reallocstats.out | tail -n 1)
echo "      C4: On Error Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE


FREE=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" ../results/freestats.out | tail -n 1)
REALLOC=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" ../results/reallocstats.out | tail -n 1)
echo "      C5: Arbitrary Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

echo "   \end{tabularx}
\end{center}
   \caption{Count of Categories by Function.}
   \label{tab:categories:overview}
\end{table}
" >> $LATEX_FILE
