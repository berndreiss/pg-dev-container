#!/bin/bash

LATEX_FILE=../results/resultsLatex.tex
STATS_FILE_FREE=../results/collected/stats_free.out
STATS_FILE_REALLOC=../results/collected/stats_realloc.out
echo "\begin{table}[H]
   \begin{center}
   \begin{tabularx}{0.6\linewidth}{l|c|c}

      Category & Free & Realloc \\\\
      \hline
" > $LATEX_FILE

FREE=$(grep -A 1 "ALL:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ALL:" $STATS_FILE_REALLOC | tail -n 1)
echo "      All Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "SAME RETURN:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "SAME RETURN:" $STATS_FILE_REALLOC | tail -n 1)
echo "      C1: Functions To Reassign& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^STRICT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^STRICT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      C2: Strict Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      C3: Dependent Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

FREE=$(grep -A 1 "^EREPORT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^EREPORT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      C4: On Error Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE


FREE=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      C5: Arbitrary Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE

echo "   \end{tabularx}
\end{center}
   \caption{Count of Categories by Function.}
   \label{tab:categories:overview}
\end{table}
" >> $LATEX_FILE
