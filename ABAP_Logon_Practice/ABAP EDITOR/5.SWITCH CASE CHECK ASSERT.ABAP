PARAMETERS: lv_num_1 TYPE i.
PARAMETERS: lv_num_2 TYPE i.
PARAMETERS: lv_op type c LENGTH 3.
CASE lv_op.
  WHEN '+'.
    Write / | The Addition Value is: { lv_num_1 + lv_num_2 }|.
  WHEN '-'.
    Write / | The Subtraction Value is: { lv_num_1 - lv_num_2 }|.
  WHEN '*'.
    Write / | The Multiplication Value is: { lv_num_1 * lv_num_2 }|.
  WHEN '/'.
    Write / | The Division Value is: { lv_num_1 / lv_num_2 }|.
  WHEN '**'.
    Write / | The Exponential Value is: { lv_num_1 ** lv_num_2 }|.
  WHEN 'DIV'.
    Write / | The Integer Division Value is: { lv_num_1 div lv_num_2 }|.
  WHEN 'MOD'.
    Write / | The Modulus Value is: { lv_num_1 mod lv_num_2 }|.
  WHEN OTHERS.
    Write: 'Invalid Operator'.
ENDCASE.

"Check and assert

DATA lv_age TYPE i VALUE -2.
START-OF-SELECTION.
ASSERT lv_age >= 0.
CHECK lv_age >= 18.
WRITE / 'Eligible for voting'.