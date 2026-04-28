FORM string_operations.
  DATA(lv_string_1) = 'Harish'.
  DATA(lv_string_2) = 'Ragav'.
  DATA(lv_string_3) = 'ABAP is SAPs Programming Lang'.
  WRITE / |The Concatenated value is: { lv_string_1 && lv_string_2 }|.

  IF lv_string_1 CO lv_string_2.
    WRITE / |The CONTAINS ONLY is True|.
  ELSE.
    WRITE / |The CONTAINS ONLY is False|.
  ENDIF.

  IF lv_string_1 CN lv_string_2.
    WRITE / |The NOT CONTAINS ONLY is True|.
  ELSE.
    WRITE / |The NOT CONTAINS ONLY is False|.
  ENDIF.

  IF lv_string_1 CA lv_string_2.
    WRITE / |The CONTAINS ANY is True|.
  ELSE.
    WRITE / |The CONTAINS ANY is False|.
  ENDIF.

  IF lv_string_1 NA lv_string_2.
    WRITE / |The NOT CONTAINS ANY is True|.
  ELSE.
    WRITE / |The NOT CONTAINS ANY is False|.
  ENDIF.

  IF lv_string_1 CS lv_string_2.
    WRITE / |The CONTAINS STRING is True|.
  ELSE.
    WRITE / |The CONTAINS STRING is False|.
  ENDIF.

  IF lv_string_1 NS lv_string_2.
    WRITE / |The CONTAINS STRING is True|.
  ELSE.
    WRITE / |The CONTAINS STRING is False|.
  ENDIF.

  IF lv_string_1 CP 'H*'.
    WRITE / |The CONTAINS PATTERN is True|.
  ELSE.
    WRITE / |The CONTAINS PATTERN is False|.
  ENDIF.

  IF lv_string_1 NP 'H*'.
    WRITE / |The NOT CONTAINS PATTERN is True|.
  ELSE.
    WRITE / |The NOT CONTAINS PATTERN is False|.
  ENDIF.
  ULINE.
  WRITE / |The length of String 1 is:  { strlen( lv_string_1 ) }|.
  WRITE / |The Position of r in String 1 is:  { find( val = lv_string_1 sub = 'r' ) }|.
  "WRITE / |Contains 'Sap' : { contains( val = lv_string_1 sub = 'Sap' ) }|.  Not Working
  WRITE / |Upper Case: { to_upper( lv_string_2 ) }|.
  WRITE / |Lower Case: { to_lower( lv_string_1 ) }|.
  WRITE / |Condensed String: { condense( lv_string_3 ) } |.
  WRITE / |Replaced Word in String 3: { replace( val = lv_string_3 sub = 'Lang' with = 'Language' ) }|.
  WRITE / |Repeated Word: { repeat( val = 'ABAP' occ = 3 ) } |.
  WRITE / |Reversed String: { reverse( lv_string_2 ) }|.
  WRITE / |First 3 characters : { substring( val = lv_string_1 off = 0 len = 3 ) }|.
  WRITE / |Characters from position 4 : { substring( val = lv_string_3 off = 4 ) }|.
  WRITE / |Last 5 characters : { substring( val = lv_string_1 off = strlen( lv_string_1 ) - 5 ) }|.
  WRITE / |Count of 'A' : { count( val = lv_string_3 sub = 'a' ) }|.
ENDFORM.