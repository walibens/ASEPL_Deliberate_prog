REPORT yr_fizzbuzz_dp.

CLASS lcl_fizzbuzz DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS calculate
      IMPORTING
        number        TYPE i
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.
  METHOD calculate.
    result = 1.
  ENDMETHOD.
ENDCLASS.



CLASS ltc_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS :
      number1_returns_1 FOR TESTING.

ENDCLASS.


CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD number1_returns_1.
    DATA cut TYPE REF TO lcl_fizzbuzz.
    cl_abap_unit_assert=>assert_equals( exp = 1 act = cut->calculate( 1 ) ).
  ENDMETHOD.
ENDCLASS.
