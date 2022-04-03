# rounding-module
Interactive rounding module - rounds numbers from file to any specified decimal(s). Accepts files as input. Logs output line by line in new text file.


List file format:
- One numerical value per line
- Any amount of lines
- Integer separated from decimal(s) by either dot or comma
- The file can contain text on lines; the output in the log will be incorrect for that line

____

INSTALL

sudo apt-get install calc git

1. Obtain roundm via git clone or grabber of choice, e.g. #git clone [link_to_repo_here]
2. Run #bash roundm
3. Done.

____

INSTRUCTIONS FOR USE

1. Copy-paste the file path including file name, e.g. home/me/Desktop/my_list.txt
2. Confirm entry is correct
3. Specify output filename (find it in the OUTPUT_LOGS folder)
4. Select rounding up or down
5. Select rounding module v1.01 or v1.02
6. Enter decimal(s) to round to
7. Done

Find the output in a new text file

____

ROUNDING DOWN MODULES

- v1.01 Calculates the nearest (multiple of) specified decimals with the integer as starting point (e.g. with rounding down set at 0.75, the number 1,55 will round down to 1.00)
- v1.02 Calculates the nearest (multiple of) specified decimals with 0 (zero) as starting point (e.g. with rounding down set at 0.75, the number 1,55 will round down to 1.50)

____

ROUNDING UP MODULES

- v1.01 Calculates the nearest (multiple of) specified decimals with the integer as starting point (e.g. with rounding up set at 0.75, the number 1,55 will round up to 1.75)
- v1.02 Calculates the nearest (multiple of) specified decimals with 0 (zero) as starting point (e.g. with rounding up set at 0.75, the number 1,55 will round up to 2,25)

____

CHANGELOG

- v2.02
  removed alias setup until release of v3.00
- v2.01
  included alias setup
- v2.00
  up
