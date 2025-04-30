       IDENTIFICATION DIVISION.
       PROGRAM-ID. LoopsPractice.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 COUNTER       PIC 9(2) VALUE 1.        *> Loop counter for PERFORM UNTIL
       01 I             PIC 9(2).                *> Loop variable for VARYING loop
       01 RUNNING-TOTAL PIC 9(4) VALUE 0.        *> Sum of numbers from 1 to 5
       01 ADD-TEXT      PIC X(40).               *> Used to build display string

       PROCEDURE DIVISION.

           DISPLAY ">>> Example 1: PERFORM UNTIL <<<"
           
           *> Loop until COUNTER > 5
           PERFORM UNTIL COUNTER > 5
               DISPLAY "Iteration: " COUNTER
               ADD 1 TO COUNTER
           END-PERFORM

           DISPLAY ">>> Example 2: PERFORM VARYING <<<"

           *> Loop using VARYING syntax, which works like a FOR loop
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Counting with I = " I
           END-PERFORM

           DISPLAY ">>> Example 3: Add numbers 1 to 5 <<<"

           *> Reset RUNNING-TOTAL and use a loop to accumulate
           MOVE 0 TO RUNNING-TOTAL

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               ADD I TO RUNNING-TOTAL
               DISPLAY "Adding: " I " - Running Total: " RUNNING-TOTAL
           END-PERFORM

           DISPLAY "Final Total: " RUNNING-TOTAL

           STOP RUN.
