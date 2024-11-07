REPORT yr_roman_num_wbs.

CLASS lcl_to_roman_converter DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS convert
      IMPORTING
        arab         TYPE i
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_to_roman_converter IMPLEMENTATION.


  METHOD convert.
    result = 'I'.
  ENDMETHOD.

ENDCLASS.



CLASS ltc_to_roman_converter DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      I_gives_1 FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_to_roman_converter IMPLEMENTATION.

  METHOD I_gives_1.
    DATA: cut TYPE REF TO lcl_to_roman_converter.
          cut = new #(  ).
    cl_abap_unit_assert=>assert_equals(  exp = 'I' act = cut->convert( 1 ) ).
  ENDMETHOD.

ENDCLASS.

class ltc_from_roman_converter definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      first_test for testing raising cx_static_check.
endclass.


class ltc_from_roman_converter implementation.

  method first_test.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).

  endmethod.

endclass.
