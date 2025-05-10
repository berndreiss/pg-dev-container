#!/bin/bash

LATEX_FILE=../results/resultsLatex.tex
STATS_FILE_FREE=../results/collected/stats_free.out
STATS_FILE_REALLOC=../results/collected/stats_realloc.out
CATEGORY=C
COUNT=1
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

FREE=$(grep -A 1 "^STRICT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^STRICT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Strict Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))

FREE=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Dependent Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))

FREE=$(grep -A 1 "^EREPORT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^EREPORT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: On Error Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))


FREE=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ALL WITHOUT REASSIGNED, STRICT, DEPENDENT, AND EREPORT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Arbitrary Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))

FREE=$(grep -A 1 "SAME RETURN:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "SAME RETURN:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Functions To Reassign& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))

echo "   \end{tabularx}
\end{center}
   \caption{Count of Categories by Function.}
   \label{tab:categories:overview}
\end{table}
" >> $LATEX_FILE
