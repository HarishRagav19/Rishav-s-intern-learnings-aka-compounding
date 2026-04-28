PARAMETERS: Stu_name TYPE string.
PARAMETERS: Stu_reg TYPE i.

PARAMETERS: Male   RADIOBUTTON GROUP gen,
            Female RADIOBUTTON GROUP gen,
            be     RADIOBUTTON GROUP cour,
            BTech  RADIOBUTTON GROUP cour,
            BSc    RADIOBUTTON GROUP cour.

WRITE:
 /'The student name: ', Stu_name,
 /'The student register no: ' NO-GAP, Stu_reg LEFT-JUSTIFIED.

IF male = abap_true.
  WRITE / |Male -> { Stu_name }|.
ELSEIF female = abap_true.
  WRITE / |Female -> { Stu_name }|.
ENDIF.

IF be = abap_true.
  WRITE / | { Stu_name } is BE|.
ELSEIF btech = abap_true.
  WRITE / |{ Stu_name } is BTECH|.
ELSEIF BSc = abap_true.
  WRITE / |{ Stu_name } is BSC|.
ENDIF.
ULINE.
WRITE: /'Technologies Known'.

PARAMETERS: python AS CHECKBOX.
PARAMETERS: java AS CHECKBOX.
PARAMETERS: react AS CHECKBOX.
PARAMETERS: abap AS CHECKBOX.

IF ( python IS NOT INITIAL ).
  WRITE / |{ Stu_name } knows python|.
ENDIF.
IF ( Java IS NOT INITIAL ).
  WRITE / |{ Stu_name } knows java|.
ENDIF.
IF ( react IS NOT INITIAL ).
  WRITE / |{ Stu_name } knows react|.
ENDIF.
IF ( abap IS NOT INITIAL ).
  WRITE / |{ Stu_name } knows abap|.
ENDIF.
ULINE.

SKIP 2.
WRITE: 'Future Analysis'.

*IF ( be = 'X' AND female = 'X' ).
*  WRITE / |{ stu_name } is selected to Google|.
*ELSEIF ( btech = 'X' AND male = 'X' ).
*  WRITE / |{ stu_name } is selected to Microsoft|.
*ELSE.
*  WRITE / |Better Luck Next Time!|.
*ENDIF.

*Nested If
IF ( male ='X' ).
  IF ( be = 'X' ).
    WRITE / |{ stu_name } is selected to KaarTech|.
  ELSEIF ( BTECH = 'X' ).
    WRITE / |{ stu_name } is selected to Motiva|.
  ELSE.
    WRITE / |{ stu_name } is selected to Medplus to supply Medicines|.
  ENDIF.
ELSE.
  IF ( be = 'X' ).
    WRITE / |{ stu_name } is selected to KaarTech|.
  ELSEIF ( BTECH = 'X' ).
    WRITE / |{ stu_name } is selected to Motiva|.
  ELSE.
    WRITE / |{ stu_name } is selected to Medplus to supply Medicines|.
  ENDIF.
ENDIF.
MESSAGE 'Your Future is Bright! Best of Luck!' TYPE 'S'.
uline.
