       IDENTIFICATION DIVISION.
       PROGRAM-ID. ArrayExample.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SCORES.
          05 SCORE OCCURS 5 TIMES PIC 9(3).  *> Array of 5 scores, 3 digits each

       01 I        PIC 9 VALUE 1.            *> Loop counter
       01 TOTAL    PIC 9(4) VALUE 0.         *> Sum of scores
       01 AVERAGE  PIC 9(3)V9(2).            *> Computed average (e.g., 075.20)

       PROCEDURE DIVISION.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Enter score " I ":"
               ACCEPT SCORE(I)               *> Read each score into array
               ADD SCORE(I) TO TOTAL         *> Add score to total
           END-PERFORM

           COMPUTE AVERAGE = TOTAL / 5

           DISPLAY "----- Results -----"
           DISPLAY "Total Score: " TOTAL
           DISPLAY "Average Score: " AVERAGE

           STOP RUN.
