#!/bin/bash
#Rounds lists of numbers up to the nearest (multiple of) specified decimal(s).
#v1.01
#github.com/bveldhuyzen
#2021

FULL_NUMBER=$(<full_number_1.txt)

ROUND_TO_THIS=$(<round_to_this.txt)

echo "$FULL_NUMBER" | awk '{print int($0)}' > integer.txt
INTEGER=$(<integer.txt)

calc -d "$FULL_NUMBER - $INTEGER" > leftover_decimals.txt
DECIMALS=$(<leftover_decimals.txt)

calc -d "$DECIMALS / $ROUND_TO_THIS" > MULTIPLICATION_FACTOR.txt
MULTIPLICATION_FACTOR=$(<MULTIPLICATION_FACTOR.txt)


echo "$MULTIPLICATION_FACTOR" | awk '{print int($0)}' > MULTIPLICATION_FACTOR_total.txt
MULTIPLICATION_FACTOR_TOTAL=$(<MULTIPLICATION_FACTOR_total.txt)

calc -d "$MULTIPLICATION_FACTOR - $MULTIPLICATION_FACTOR_TOTAL" > steps_leftover_decimals.txt 
STEPS_LEFTOVER_DECIMALS=$(<steps_leftover_decimals.txt)

awk '$1>0 {$1=1} 1' steps_leftover_decimals.txt > steps_leftover_decimals_1.txt
STEPS_LEFTOVER_DECIMALS_1=$(<steps_leftover_decimals_1.txt)

if [[ $STEPS_LEFTOVER_DECIMALS_1 -eq 1 ]]
then
calc -d "$MULTIPLICATION_FACTOR_TOTAL + 1" > MULTIPLICATION_FACTOR_done.txt
else
head -1 MULTIPLICATION_FACTOR_total.txt > MULTIPLICATION_FACTOR_done.txt
fi

MULTIPLICATION_FACTOR_TOTAL_DONE=$(<MULTIPLICATION_FACTOR_done.txt)

calc -d "$MULTIPLICATION_FACTOR_TOTAL_DONE * $ROUND_TO_THIS" > new_decimals.txt
NEW_DECIMALS=$(<new_decimals.txt)

calc -d "$INTEGER + $NEW_DECIMALS" > rounded_number.txt
ROUNDED_NUMBER=$(<rounded_number.txt)


#you may for example store the rounded number in a file of choice to create a list, e.g.
#
#touch LIST_DATE_TEST.txt
OUTPUT_FILENAME_1=$(<OUTPUT_LOGS/output_filename_for_the_rounding_module)
cd OUTPUT_LOGS
echo "$ROUNDED_NUMBER" >> "$OUTPUT_FILENAME_1"
cd -
#
#read -p 'pause'


#V
