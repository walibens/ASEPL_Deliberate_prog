REPORT yr_roman_num_wbs.

CLASS lcl_roman_numeral DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS convert
      IMPORTING
        roman         TYPE string
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_roman_numeral IMPLEMENTATION.


  METHOD convert.
    result = 1.
  ENDMETHOD.

ENDCLASS.



CLASS ltc_roman_numeral DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      I_gives_1 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_roman_numeral IMPLEMENTATION.

  METHOD I_gives_1.
    DATA: cut TYPE REF TO lcl_roman_numeral.
          cut = new #(  ).
    cl_abap_unit_assert=>assert_equals(  exp = 1 act = cut->convert( 'I' ) ).
  ENDMETHOD.

ENDCLASS.
