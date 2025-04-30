       IDENTIFICATION DIVISION.
       PROGRAM-ID. PolynomialsMain.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 MAX-DEGREE          PIC 99 VALUE 20.
       01 NEW-DEGREE            PIC 99.
       01 I                   PIC 99.
       01 X                   PIC S9(4).
       
       *> Define zero(x)
       01 Z.
           05 Z-DEGREE        PIC 99 VALUE 0.
           05 Z-COEF          OCCURS 20 TIMES
                               PIC S9(4) COMP-5 VALUE 0.

       *> Define p(x)
       01 P.
           05 P-DEGREE        PIC 99 VALUE 0.
           05 P-COEF          OCCURS 20 TIMES
                               PIC S9(4) COMP-5 VALUE 0.

       *> Define q(x)
       01 Q.
           05 Q-DEGREE        PIC 99 VALUE 0.
           05 Q-COEF          OCCURS 20 TIMES
                               PIC S9(4) COMP-5 VALUE 0.

       *> Define r(x) for result of operations
       01 R.
           05 R-DEGREE        PIC 99 VALUE 0.
           05 R-COEF          OCCURS 20 TIMES
                               PIC S9(4) COMP-5 VALUE 0.

       01 EVAL-VALUE   PIC 99 VALUE 3.
       01 ACTION-COMMAND      PIC X(10) VALUE SPACES.

       PROCEDURE DIVISION.
           *> zero(x) = 0
           MOVE 0 TO Z-COEF(1)
           MOVE 1 TO Z-DEGREE

           *> p(x) = 4x^3 + 3x^2 + 2x + 1
           MOVE 1 TO P-COEF(1)
           MOVE 2 TO P-COEF(2)
           MOVE 3 TO P-COEF(3)
           MOVE 4 TO P-COEF(4)
           MOVE 4 TO P-DEGREE

           *> q(x) = 3x^2 + 5
           MOVE 5 TO Q-COEF(1)
           MOVE 0 TO Q-COEF(2)
           MOVE 3 TO Q-COEF(3)
           MOVE 3 TO Q-DEGREE

           *> Print zero(x)
           DISPLAY "zero(x)     = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING Z P EVAL-VALUE ACTION-COMMAND

           *> Print p(x)
           DISPLAY "p(x)        = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING P Q EVAL-VALUE ACTION-COMMAND

           *> Print q(x)
           DISPLAY "q(x)        = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING Q P EVAL-VALUE ACTION-COMMAND

           *> r = p + q
           MOVE P TO R
           MOVE "ADD" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND
           DISPLAY "p(x) + q(x) = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           *> r = p * q
           MOVE P TO R
           MOVE "MUL" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND
           DISPLAY "p(x) * q(x) = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           *> r = p(q(x))
           MOVE P TO R
           MOVE "COMP" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND
           DISPLAY "p(q(x))     = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           *> r = 0 - p(x)
           MOVE Z TO R
           MOVE "SUB" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R P EVAL-VALUE ACTION-COMMAND
           DISPLAY "0 - p(x)    = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           *> Evaluate p(3)
           MOVE 3 TO EVAL-VALUE
           DISPLAY "p(3)        = " WITH NO ADVANCING
           MOVE "EVAL" TO ACTION-COMMAND
           CALL "PolynomialModule" USING P Q EVAL-VALUE ACTION-COMMAND

           *> Derivative p'(x)
           MOVE P TO R
           MOVE "DERIV" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND
           DISPLAY "p'(x)       = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           *> Second derivative p''(x)
           MOVE "DERIV" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND
           DISPLAY "p''(x)      = " WITH NO ADVANCING
           MOVE "DISPLAY2" TO ACTION-COMMAND
           CALL "PolynomialModule" USING R Q EVAL-VALUE ACTION-COMMAND

           STOP RUN.
