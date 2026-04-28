DATA lv_count TYPE i VALUE 1.

START-OF-SELECTION.
WRITE / 'WHILE LOOP OUTPUT:'.
WHILE lv_count <= 5.
  WRITE / |WHILE LOOP Count: { lv_count }|.
  lv_count = lv_count + 1.
ENDWHILE.

ULINE.
WRITE / 'DO LOOP OUTPUT:'.

DO 5 TIMES.
  WRITE / |DO LOOP Count: { sy-index }|.
ENDDO.

"LOOP CONTROL STATEMENT

START-OF-SELECTION.
DO 15 TIMES.
  CHECK sy-index <= 2.
  IF sy-index = 3.
    CONTINUE.
  ENDIF.

  IF sy-index = 10.
    EXIT.
  ENDIF.
  WRITE / |Loop Iteration: { sy-index }|.
ENDDO.