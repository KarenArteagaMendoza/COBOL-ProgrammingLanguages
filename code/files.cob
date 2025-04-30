       IDENTIFICATION DIVISION.
       PROGRAM-ID. SaveEmployeeToFile.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "EMPLOYEE.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-RECORD.
           05 EMP-ID      PIC 9(5).
           05 EMP-NAME    PIC X(30).
           05 EMP-SALARY  PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01 WS-EMP-ID      PIC 9(5).
       01 WS-EMP-NAME    PIC X(30).
       01 WS-EMP-SALARY  PIC 9(7)V99.

       01 WS-FINISH      PIC X VALUE "N".

       PROCEDURE DIVISION.

           OPEN OUTPUT EMP-FILE

           PERFORM UNTIL WS-FINISH = "Y"
               DISPLAY "Enter Employee ID:"
               ACCEPT WS-EMP-ID

               DISPLAY "Enter Employee Name:"
               ACCEPT WS-EMP-NAME

               DISPLAY "Enter Employee Salary:"
               ACCEPT WS-EMP-SALARY

               *> Move input data to record structure
               MOVE WS-EMP-ID     TO EMP-ID
               MOVE WS-EMP-NAME   TO EMP-NAME
               MOVE WS-EMP-SALARY TO EMP-SALARY

               *> Write to file
               WRITE EMP-RECORD

               DISPLAY "Record saved. Add another? (Y/N)"
               ACCEPT WS-FINISH
               MOVE FUNCTION UPPER-CASE(WS-FINISH) TO WS-FINISH
               IF WS-FINISH NOT = "Y"
                   MOVE "Y" TO WS-FINISH
               ELSE
                   MOVE "N" TO WS-FINISH
               END-IF
           END-PERFORM

           CLOSE EMP-FILE

           DISPLAY "All employee records saved successfully."
           STOP RUN.
