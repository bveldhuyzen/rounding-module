#!/bin/bash
#Rounds lists of numbers up to the nearest (multiple of) specified decimal(s).
#v1.02
#github.com/bveldhuyzen
#2021

FULL_NUMBER=$(<full_number_1.txt)

ROUND_TO_THIS=$(<round_to_this.txt)

calc -d "$FULL_NUMBER / $ROUND_TO_THIS" > MPF.txt
MPF=$(<MPF.txt)

echo $MPF | awk '{print int($0)}' > MPF_total.txt
MPF_TOTAL=$(<MPF_total.txt)

calc -d "$MPF - $MPF_TOTAL" > steps_leftover_decimals.txt
STEPS_LEFTOVER_DECIMALS=$(<steps_leftover_decimals.txt)

awk '$1>0 {$1=1} 1' steps_leftover_decimals.txt > steps_leftover_decimals_1.txt
STEPS_LEFTOVER_DECIMALS_1=$(<steps_leftover_decimals_1.txt)

if [[ $STEPS_LEFTOVER_DECIMALS_1 -eq 1 ]]
then
calc -d "$MPF_TOTAL + 1" > MPF_done.txt
else
head -1 MPF_total.txt > MPF_done.txt
fi

MULTIPLICATION_FACTOR_TOTAL_DONE=$(<MPF_done.txt)

calc -d "$MULTIPLICATION_FACTOR_TOTAL_DONE * $ROUND_TO_THIS" > rounded_up_number.txt
ROUNDED_UP_NUMBER=$(<rounded_up_number.txt)

touch LIST_DATE_TEST_2.txt
echo "$ROUNDED_UP_NUMBER" >> LIST_DATE_TEST_2.txt

rm full_number_1.txt round_to_this.txt MPF.txt MPF_total.txt MPF_done.txt steps_leftover_decimals.txt steps_leftover_decimals_1.txt rounded_up_number.txt

#V

