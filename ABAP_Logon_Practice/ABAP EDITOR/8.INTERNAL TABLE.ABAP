FILE NAME -> ZSHR_IT_QUERIES_PROGRAM.

TYPES: BEGIN OF lv_struct_cricketer,
         cricketer_name    TYPE string,
         cricketer_jersey  TYPE i,
         type_of_cricketer TYPE string,
         ranking           TYPE i,
       END OF lv_struct_cricketer.

DATA: it_cricketer TYPE TABLE OF lv_struct_cricketer.
DATA: wa_cricketer TYPE lv_struct_cricketer.
*&------------------------------------------------------------------------------------------------------------------*
"Type-1 to append
wa_cricketer-cricketer_name = 'Virat Kohli'.
wa_cricketer-cricketer_jersey = 18.
wa_cricketer-type_of_cricketer = 'Batsman'.
wa_cricketer-ranking = 1.
APPEND wa_cricketer TO it_cricketer.

wa_cricketer-cricketer_name = 'MS Dhoni'.
wa_cricketer-cricketer_jersey = 7.
wa_cricketer-type_of_cricketer = 'Wicket Keeper'.
wa_cricketer-ranking = 2.
APPEND wa_cricketer TO it_cricketer.

*Type-2 to append
APPEND VALUE lv_struct_cricketer(
       cricketer_name = 'Rohit Sharma'
       cricketer_jersey = 45
       type_of_cricketer = 'Batsman'
       ranking = 3 ) TO it_cricketer.

*Type-3 to append
*it_cricketer = VALUE #(
*   ( cricketer_name = 'Virat Kohli' cricketer_jersey = 18 type_of_cricketer = 'Batsman' ranking = 1 )
*   ( cricketer_name = 'MS Dhoni' cricketer_jersey = 7 type_of_cricketer = 'Wicket Keeper' ranking = 2 )
*   ( cricketer_name = 'Rohit Sharma' cricketer_jersey = 45 type_of_cricketer = 'Batsman' ranking = 3 )
*).
"Using Base helps the data so that it does not overwrites the pre-existing data without it the data is overwritten.
it_cricketer = VALUE #(
  BASE it_cricketer
  ( cricketer_name = 'ABD' cricketer_jersey = 17 type_of_cricketer = 'Batsman' ranking = 1 )
  ( cricketer_name = 'Starc' cricketer_jersey = 97 type_of_cricketer = 'Seamer' ranking = 1 )
  ( cricketer_name = 'Rashid' cricketer_jersey = 100 type_of_cricketer = 'Leggie' ranking = 2 )
).
*&------------------------------------------------------------------------------------------------------------------*
"INSERT
wa_cricketer-cricketer_name = 'Bumrah'.
wa_cricketer-cricketer_jersey = 90.
wa_cricketer-type_of_cricketer = 'Seamer'.
wa_cricketer-ranking = 2.

INSERT wa_cricketer INTO it_cricketer INDEX 1.
*&------------------------------------------------------------------------------------------------------------------*
*Displaying Type-1
*LOOP AT it_cricketer INTO wa_cricketer.
*  WRITE: / wa_cricketer-cricketer_name,
*           wa_cricketer-cricketer_jersey,
*           wa_cricketer-type_of_cricketer,
*           wa_cricketer-ranking.
*ENDLOOP.

**Display Type-2
*WRITE: /1  'NAME',
*       25 'JERSEY',
*       35 'TYPE',
*       55 'RANK'.
*ULINE.
*LOOP AT it_cricketer INTO wa_cricketer.
*  WRITE: /1  wa_cricketer-cricketer_name ,
*         25 wa_cricketer-cricketer_jersey LEFT-JUSTIFIED,  "Without LEFT-JUSTIFIED the alignment will be changed
*         35 wa_cricketer-type_of_cricketer,
*         55 wa_cricketer-ranking LEFT-JUSTIFIED.
*ENDLOOP.

**Display Type-3
WRITE: / |{ 'NAME' WIDTH = 20 }|,
       |{ 'JERSEY' WIDTH = 10 }|,
       |{ 'TYPE' WIDTH = 18 }|,
       |{ 'RANK' WIDTH = 5 }|.
ULINE.
LOOP AT it_cricketer INTO wa_cricketer.
  WRITE:/
  |{ wa_cricketer-cricketer_name WIDTH = 20 }|,
         |{ wa_cricketer-cricketer_jersey WIDTH = 10 }|,
         |{ wa_cricketer-type_of_cricketer WIDTH = 18 }|,
         |{ wa_cricketer-ranking WIDTH = 5 }|.
ENDLOOP.
*&------------------------------------------------------------------------------------------------------------------*
*Reading from Internal table
ULINE.
"Type-1 of read
READ TABLE it_cricketer INTO wa_cricketer INDEX 2.

IF sy-subrc = 0.
  WRITE / | The Cricketer is { wa_cricketer-cricketer_name } |.
ELSE.
  WRITE / 'No Data Found'.
ENDIF.

"Type-2 of Read
READ TABLE it_cricketer INTO wa_cricketer
     WITH KEY cricketer_jersey = 7.
IF sy-subrc = 0.
  WRITE / | The Cricketer is { wa_cricketer-cricketer_name } |.
ELSE.
  WRITE / 'No Data Found'.
ENDIF.

"Type-3 of Read
READ TABLE it_cricketer
     WITH KEY cricketer_name = 'ABD'
     TRANSPORTING NO FIELDS.
IF sy-subrc = 0.
  WRITE / | ABD Exists |.
ELSE.
  WRITE / 'ABD Does not Exists'.
ENDIF.

"Type-4 of Read
FIELD-SYMBOLS <fs_cricketer> TYPE lv_struct_cricketer.

READ TABLE it_cricketer ASSIGNING <fs_cricketer>
     WITH KEY cricketer_name = 'Bumrah'.
IF sy-subrc = 0.
  WRITE / | The Cricketers are { <fs_cricketer>-cricketer_name }|.
ELSE.
  WRITE / 'No Data Found'.
ENDIF.

"Type-5 of Read
DATA(wa_cricketer_1) = it_cricketer[ cricketer_name = 'Rashid' ].
IF sy-subrc = 0.
  WRITE / | Rashid Exists |.
ELSE.
  WRITE / 'Rashid Does not Exists'.
ENDIF.
*------------------------------------------------------------------------------------------------------------------*