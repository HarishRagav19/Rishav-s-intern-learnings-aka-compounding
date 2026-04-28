FILE NAME: ZSHR_ABAP_BASICS_PROGRAM

FORM dataype_variables.
  DATA lv_int TYPE i VALUE 10.
  DATA lv_char TYPE c VALUE 'H'.
  DATA lv_string TYPE string VALUE 'HARISH RAGAV'.

  DATA lv_date TYPE d. "If we declare straightly we will get error so declare it and then assign the value"
  lv_date = sy-datum.

  DATA lv_numeric_char TYPE n LENGTH 6 VALUE '901919'. "Here we will get a warning sign if length is not given, the default value is 1"

  DATA lv_time TYPE t."If we declare straightly we will get error so declare it and then assign the value"
  lv_time = sy-uzeit.

  data lv_float type f value '9.11'. "Here without quotes we will get error otherwise we can assign after declaration. 

  WRITE:
        / 'The value of lv_int is', lv_int,
        / 'The value of lv_char is', lv_char,
        / 'The value of lv_string is', lv_string,
        / 'The value of lv_date is', lv_numeric_char,
        / 'The value of lv_time is', lv_time,
        / 'The value of lv_float is', lv_float.
ENDFORM.