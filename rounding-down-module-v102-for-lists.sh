#!/bin/bash
#Rounds any number down to the nearest (multiple of) any specified decimal(s).
#v1.02
#github.com/bveldhuyzen
#2021

FULL_NUMBER=$(<full_number_1.txt)

ROUND_TO_THIS=$(<round_to_this.txt)

calc -d "$FULL_NUMBER / $ROUND_TO_THIS" > MPF.txt
MPF=$(<MPF.txt)

echo $MPF | awk '{print int($0)}' > MULTIPLICATION_FACTOR_total.txt
MULTIPLICATION_FACTOR_TOTAL=$(<MULTIPLICATION_FACTOR_total.txt)

calc -d "$MULTIPLICATION_FACTOR_TOTAL * $ROUND_TO_THIS" > rounded_down_number.txt
ROUNDED_NUMBER=$(<rounded_down_number.txt)

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
