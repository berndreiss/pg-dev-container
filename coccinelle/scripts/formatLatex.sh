#!/bin/bash

LATEX_FILE=../results/resultsLatex.tex
LATEX_FILE_NUMBERS=../results/resultsLatexNumbers.tex
STATS_FILE_FREE=../results/collected/stats_free.out
STATS_FILE_REALLOC=../results/collected/stats_realloc.out
CATEGORY=C
COUNT=1

if [[ -f $LATEX_FILE_NUMBERS ]]; then
  rm $LATEX_FILE_NUMBERS
fi

echo "\begin{table}[H]
   \centering
   \begin{tabularx}{0.7\linewidth}{l|c|c}

      Category & Free & Realloc \\\\
      \hline
" > $LATEX_FILE

FREE=$(grep -A 1 "ALL:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ALL:" $STATS_FILE_REALLOC | tail -n 1)
echo "      All Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
echo "\\newcommand{\\freeall}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocall}{$REALLOC}" >> $LATEX_FILE_NUMBERS

FREE=$(grep -A 1 "ALL WITHOUT STATIC:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ALL WITHOUT STATIC:" $STATS_FILE_REALLOC | tail -n 1)
echo "      All without static& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
echo "\\newcommand{\\freenostatic}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocnostatic}{$REALLOC}" >> $LATEX_FILE_NUMBERS

FREE=$(grep -A 1 "^STRICT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^STRICT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Strict Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))
echo "\\newcommand{\\freestrict}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocstrict}{$REALLOC}" >> $LATEX_FILE_NUMBERS

FREE=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "^DEPENDENT:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Dependent Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))
echo "\\newcommand{\\freedependent}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocdependent}{$REALLOC}" >> $LATEX_FILE_NUMBERS

#FREE=$(grep -A 1 "^EREPORT:" $STATS_FILE_FREE | tail -n 1)
#REALLOC=$(grep -A 1 "^EREPORT:" $STATS_FILE_REALLOC | tail -n 1)
#echo "      $CATEGORY$COUNT: On Error Functions& $FREE & $REALLOC \\\\
#" >> $LATEX_FILE
#COUNT=$((COUNT+1))


FREE=$(grep -A 1 "ARBITRARY:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "ARBITRARY:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Arbitrary Functions& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))
echo "\\newcommand{\\freearbitrary}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocarbitrary}{$REALLOC}" >> $LATEX_FILE_NUMBERS

FREE=$(grep -A 1 "SAME RETURN:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "SAME RETURN:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Functions to Reassign& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))
echo "\\newcommand{\\freesamereturn}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocsamereturn}{$REALLOC}" >> $LATEX_FILE_NUMBERS

FREE=$(grep -A 1 "BOOL RETURN:" $STATS_FILE_FREE | tail -n 1)
REALLOC=$(grep -A 1 "BOOL RETURN:" $STATS_FILE_REALLOC | tail -n 1)
echo "      $CATEGORY$COUNT: Functions Returning Boolean& $FREE & $REALLOC \\\\
" >> $LATEX_FILE
COUNT=$((COUNT+1))
echo "\\newcommand{\\freebool}{$FREE}" >> $LATEX_FILE_NUMBERS
echo "\\newcommand{\\reallocbool}{$REALLOC}" >> $LATEX_FILE_NUMBERS

echo "   \end{tabularx}
   \caption{Number of Categories by Function}
   \label{tab:categories:overview}
\end{table}
" >> $LATEX_FILE
