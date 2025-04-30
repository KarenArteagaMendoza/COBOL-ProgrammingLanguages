       IDENTIFICATION DIVISION.
       PROGRAM-ID. IfConditionsPractice.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 AGE              PIC 99.             *> User's age
       01 COUNTRY          PIC X(20).          *> User's country
       01 ELIGIBLE-TO-VOTE PIC X(3).           *> 'YES' or 'NO'

       PROCEDURE DIVISION.

           DISPLAY "Enter your age:"
           ACCEPT AGE

           *> Simple IF: Check if user is an adult
           IF AGE >= 18
               DISPLAY "You are an adult."
           ELSE
               DISPLAY "You are a minor."
           END-IF

           DISPLAY "Enter your country:"
           ACCEPT COUNTRY

           *> Nested IF: Check voting eligibility based on country and age
           IF COUNTRY = "USA"
               IF AGE >= 18
                   MOVE "YES" TO ELIGIBLE-TO-VOTE
               ELSE
                   MOVE "NO" TO ELIGIBLE-TO-VOTE
               END-IF
           ELSE
               IF AGE >= 16
                   MOVE "YES" TO ELIGIBLE-TO-VOTE
               ELSE
                   MOVE "NO" TO ELIGIBLE-TO-VOTE
               END-IF
           END-IF

           DISPLAY "Eligible to Vote: " ELIGIBLE-TO-VOTE

           STOP RUN.
