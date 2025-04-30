       IDENTIFICATION DIVISION.
       PROGRAM-ID. PicExample.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 EMPLOYEE-NAME     PIC X(30).        *> Alphanumeric text field (name)
       01 EMPLOYEE-ID       PIC 9(5).         *> 5-digit numeric ID
       01 ANNUAL-SALARY     PIC 9(7)V99.      *> Annual salary with 2 decimal places
       01 MONTHLY-SALARY    PIC 9(5)V99.      *> Monthly salary with 2 decimal places

       PROCEDURE DIVISION.

           DISPLAY "Enter Employee Name:"
           ACCEPT EMPLOYEE-NAME

           DISPLAY "Enter Employee ID (5 digits):"
           ACCEPT EMPLOYEE-ID

           DISPLAY "Enter Annual Salary:"
           ACCEPT ANNUAL-SALARY

           COMPUTE MONTHLY-SALARY = ANNUAL-SALARY / 12

           DISPLAY "----- Employee Info -----"
           DISPLAY "Name: " EMPLOYEE-NAME
           DISPLAY "ID: " EMPLOYEE-ID
           DISPLAY "Monthly Salary: $" MONTHLY-SALARY

           STOP RUN.
