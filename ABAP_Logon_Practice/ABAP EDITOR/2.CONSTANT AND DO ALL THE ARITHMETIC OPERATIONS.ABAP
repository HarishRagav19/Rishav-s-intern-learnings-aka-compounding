FORM constant_arithmetic_operations.
  DATA lv_value_1 TYPE i VALUE 10.
  DATA lv_value_2 TYPE i VALUE 2.
  CONSTANTS lv_constant_value TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.
  DATA print_add TYPE p LENGTH 2 DECIMALS 1.
  DATA print_sub TYPE i.
  DATA print_mul TYPE i.
  DATA print_div TYPE f.
  DATA print_exp TYPE i.
  DATA print_div_key TYPE i.
  DATA print_mod TYPE i.
  print_add = lv_value_1 + lv_constant_value.
  print_sub = lv_value_1 - lv_value_2.
  print_mul = lv_value_1 * lv_value_2.
  print_div = lv_value_1 / 3.

  WRITE:
      /'The addition value is:', print_add,
      / 'The Subtraction value is:', print_sub,
      / 'The multiplication value is: ' NO-GAP, print_mul LEFT-JUSTIFIED,
      /'The division value is:', print_div.

  WRITE / |The Exponential value is: { lv_value_1 ** lv_value_2 }|.
  WRITE / |The numeric division value is: { lv_value_1 div lv_value_2 }|.
  WRITE / |The Modulus value is: { lv_value_1 MOD lv_value_2 }|.
ENDFORM.