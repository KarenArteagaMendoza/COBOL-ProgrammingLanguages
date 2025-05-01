IDENTIFICATION DIVISION.
       PROGRAM-ID. PolynomialModule.
       AUTHOR. Karen-Arteaga-Mendoza.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 MAX-DEGREE          PIC 99 VALUE 20.
       01 NEW-DEGREE          PIC 99.
       01 TEMP-RESULT         PIC S9(9) VALUE 0.
       01 TEMP-POWER          PIC S9(9) VALUE 1.
       01 I                   PIC 99.
       01 J                   PIC 99.
       01 K                   PIC 99.
       01 X                   PIC S9(4) VALUE 2.
       01 TMP-DEGREE          PIC 99 VALUE 0.
       01 INNER-RESULT        PIC S9(9).
       01 DISPLAY-COUNT       PIC 9 VALUE 0.
       01 TEMP-ARRAY          OCCURS 20 TIMES PIC S9(9) COMP-5 VALUE 0.
       01 DISPLAY-COEF        PIC -Z(5).
       01 DISPLAY-EXP         PIC Z(2).

       LINKAGE SECTION.

       01 POLY-REC.
           05 DEGREE        PIC 99.
           05 COEF          OCCURS 20 TIMES
                           PIC S9(4) COMP-5.

       01 OTHER-REC.
           05 O-DEGREE        PIC 99.
           05 O-COEF        OCCURS 20 TIMES
                           PIC S9(4) COMP-5.
       
       01 EVAL-VALUE      PIC 99.

       01 ACTION-COMMAND     PIC X(10).

       PROCEDURE DIVISION USING POLY-REC, OTHER-REC, EVAL-VALUE, ACTION-COMMAND.

       EVALUATE ACTION-COMMAND
           WHEN "DISPLAY2"
               PERFORM DISPLAY-POLY-2
           WHEN "ADD"
               PERFORM ADD-POLYS
           WHEN "SUB"
               PERFORM SUBTRACT-POLYS
           WHEN "MUL"
               PERFORM MULTIPLY-POLYS
           WHEN "COMP"
               PERFORM COMPOSE-POLYS
           WHEN "DERIV"
               PERFORM DERIVE-POLY
           WHEN "EVAL"
               PERFORM EVALUATE-POLY
           WHEN OTHER
               DISPLAY "Unknown command: " ACTION-COMMAND
       END-EVALUATE
       GOBACK.

       DISPLAY-POLY-2.
           *> case polynomial := zero(x)
           IF DEGREE = 1
               IF COEF(DEGREE) = 0
                   DISPLAY "0" WITH NO ADVANCING
               END-IF
           END-IF

           PERFORM VARYING I FROM DEGREE BY -1 UNTIL I < 1
           IF COEF(I) NOT = 0 
               IF COEF(I) < 0
                   DISPLAY " - " WITH NO ADVANCING
                   COMPUTE TEMP-RESULT = -1 * COEF(I)
               ELSE 
                   IF I NOT = DEGREE
                       DISPLAY " + " WITH NO ADVANCING
                   END-IF
                   COMPUTE TEMP-RESULT = COEF(I)
               END-IF
               MOVE TEMP-RESULT TO DISPLAY-COEF

               IF I = 1
                   DISPLAY FUNCTION TRIM(DISPLAY-COEF) WITH NO ADVANCING
               ELSE IF I = 2
                   DISPLAY FUNCTION TRIM(DISPLAY-COEF) "x" WITH NO ADVANCING
               ELSE
                   COMPUTE J = I - 1
                   MOVE J TO DISPLAY-EXP
                   DISPLAY FUNCTION TRIM(DISPLAY-COEF) "x^" FUNCTION TRIM(DISPLAY-EXP) WITH NO ADVANCING
               END-IF
           END-PERFORM.
           DISPLAY SPACE.
  

       ADD-POLYS.
           COMPUTE NEW-DEGREE = FUNCTION MAX(DEGREE O-DEGREE)
           PERFORM VARYING I FROM NEW-DEGREE BY -1 UNTIL I < 1
               *> DISPLAY COEF(I) "Y" O-COEF(I)
               ADD O-COEF(I) TO COEF(I)
               IF COEF(I) NOT = 0 AND I > DEGREE
                   MOVE I TO DEGREE
               END-IF
           END-PERFORM.

       SUBTRACT-POLYS.
           COMPUTE NEW-DEGREE = FUNCTION MAX(DEGREE O-DEGREE)
           PERFORM VARYING I FROM NEW-DEGREE BY -1 UNTIL I < 1
               SUBTRACT O-COEF(I) FROM COEF(I)
               IF COEF(I) NOT = 0 AND I > DEGREE
                   MOVE I TO DEGREE
               END-IF
           END-PERFORM.

       MULTIPLY-POLYS.
           MOVE 0 TO TMP-DEGREE
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAX-DEGREE
               IF COEF(I) NOT = 0
                   PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAX-DEGREE
                       IF O-COEF(J) NOT = 0
                           COMPUTE K = I + J - 1
                           COMPUTE TEMP-RESULT = COEF(I) * O-COEF(J)
                           ADD TEMP-RESULT TO TEMP-ARRAY(K)
                           IF K > TMP-DEGREE
                               MOVE K TO TMP-DEGREE
                           END-IF
                       END-IF
                   END-PERFORM
               END-IF
           END-PERFORM
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > TMP-DEGREE
               MOVE TEMP-ARRAY(I) TO COEF(I)
           END-PERFORM
           MOVE TMP-DEGREE TO DEGREE.

       DERIVE-POLY.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > DEGREE - 1
               COMPUTE J = I + 1
               COMPUTE COEF(I) = COEF(J) * I
           END-PERFORM
           SUBTRACT 1 FROM DEGREE.

       COMPOSE-POLYS.
           *> TEMP-ARRAY holds the final result of the composition
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAX-DEGREE
               MOVE 0 TO TEMP-ARRAY(I)
           END-PERFORM
       
           *> TEMP-POWER will hold q(x)^i
           *> Start with TEMP-POWER = 1 (i.e., q(x)^0)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > DEGREE
               *> Set POWER-POLY to 1 if i = 1, else multiply q(x)^i
               IF I = 1
                   MOVE 1 TO TEMP-ARRAY(1)
                   MOVE 1 TO TMP-DEGREE
               ELSE
                   *> Multiply TEMP-POWER by q(x)
                   PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAX-DEGREE
                       MOVE 0 TO TEMP-ARRAY(J)
                   END-PERFORM
                   PERFORM VARYING J FROM 1 BY 1 UNTIL J > TMP-DEGREE
                       IF COEF(J) NOT = 0
                           PERFORM VARYING K FROM 1 BY 1 UNTIL K > MAX-DEGREE
                               IF O-COEF(K) NOT = 0
                                   COMPUTE X = J + K - 1
                                   COMPUTE TEMP-ARRAY(X) = TEMP-ARRAY(X) + (COEF(J) * O-COEF(K))
                               END-IF
                           END-PERFORM
                       END-IF
                   END-PERFORM
                   *> Copy result back to COEF for next multiplication
                   PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAX-DEGREE
                       MOVE TEMP-ARRAY(J) TO COEF(J)
                   END-PERFORM
               END-IF
       
               *> Multiply q(x)^i by COEF(i) from p(x)
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > MAX-DEGREE
                   IF COEF(J) NOT = 0
                       COMPUTE TEMP-ARRAY(J) = TEMP-ARRAY(J) + COEF(J) * COEF(I)
                   END-IF
               END-PERFORM
           END-PERFORM
       
           *> Store result back in COEF
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > MAX-DEGREE
               MOVE TEMP-ARRAY(I) TO COEF(I)
               IF TEMP-ARRAY(I) NOT = 0
                   MOVE I TO DEGREE
               END-IF
           END-PERFORM.
       

       EVALUATE-POLY.
           COMPUTE TEMP-RESULT = 0
           COMPUTE TEMP-POWER = 1
           PERFORM VARYING I FROM DEGREE BY -1 UNTIL I < 1
               COMPUTE J = I - 1
               PERFORM VARYING K FROM J BY -1 UNTIL K < 1
                   COMPUTE TEMP-POWER = TEMP-POWER * EVAL-VALUE
               END-PERFORM
               COMPUTE TEMP-RESULT = TEMP-RESULT  + (TEMP-POWER * COEF(I))
               COMPUTE TEMP-POWER = 1
           END-PERFORM
           MOVE TEMP-RESULT TO DISPLAY-COEF
           DISPLAY FUNCTION TRIM(DISPLAY-COEF).
