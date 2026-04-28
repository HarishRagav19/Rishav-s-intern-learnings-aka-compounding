DATA: BEGIN OF lv_structure_1,
        name         TYPE string,
        id           TYPE i,
        age          TYPE i,
        phone_number TYPE n LENGTH 10,
        address      TYPE string,
      END OF lv_structure_1.

lv_structure_1-name = 'Harish'.
lv_structure_1-id = 19.
lv_structure_1-age = 22.
lv_structure_1-phone_number = 1234567890.
lv_structure_1-address = 'Chennai'.

lv_structure_1 = VALUE #( name = 'Harish' id = 1 age = 22 phone_number = '123456789' address = 'Chennai' ).
cl_demo_output=>new( )->write_data( lv_structure_1-name )->write_data( lv_structure_1-id )->write_data( lv_structure_1-age )->display( ).
WRITE:/ lv_structure_1-name.

TYPES: BEGIN OF lv_structure_2,
         name         TYPE string,
         id           TYPE i,
         age          TYPE i,
         phone_number TYPE n LENGTH 10,
         address      TYPE string,
       END OF lv_structure_2.

DATA lv_structure_2_test TYPE lv_structure_2.
lv_structure_2_test = VALUE #( name = 'Harish' id = 1 age = 22 phone_number = '123456789' address = 'Chennai' ).
Write:/ lv_structure_2_test-phone_number.