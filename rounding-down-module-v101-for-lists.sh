#!/bin/bash
#Rounds lists of numbers down to the nearest (multiple of) specified decimal(s).
#v1.01
#github.com/bveldhuyzen
#2021

FULL_NUMBER=$(<full_number_1.txt)

ROUND_TO_THIS=$(<round_to_this.txt)

echo $FULL_NUMBER | awk '{print int($0)}' > integer.txt
INTEGER=$(<integer.txt)

calc -d "$FULL_NUMBER - $INTEGER" > leftover_decimals.txt
DECIMALS=$(<leftover_decimals.txt)

calc -d "$DECIMALS / $ROUND_TO_THIS" > MULTIPLICATION_FACTOR.txt
MULTIPLICATION_FACTOR=$(<MULTIPLICATION_FACTOR.txt)

echo $MULTIPLICATION_FACTOR | awk '{print int($0)}' > MULTIPLICATION_FACTOR_total.txt
MULTIPLICATION_FACTOR_TOTAL=$(<MULTIPLICATION_FACTOR_total.txt)

calc -d "$MULTIPLICATION_FACTOR_TOTAL * $ROUND_TO_THIS" > new_decimals.txt
NEW_DECIMALS=$(<new_decimals.txt)

calc -d "$INTEGER + $NEW_DECIMALS" > rounded_number.txt
cat rounded_number.txt
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
