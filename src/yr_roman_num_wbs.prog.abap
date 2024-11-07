REPORT yr_roman_num_wbs.

CLASS lcl_arab_number DEFINITION .

  PUBLIC SECTION.
    METHODS : contructor IMPORTING number TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA : number TYPE i.

ENDCLASS.

CLASS lcl_arab_number IMPLEMENTATION.

  METHOD contructor.
    me->number = number.
  ENDMETHOD.

ENDCLASS.
CLASS lcl_to_roman_converter DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS convert
      IMPORTING
        arab          TYPE REF TO lcl_arab_number
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
    DATA(arab_number) = NEW lcl_arab_number( ).

    DATA: cut TYPE REF TO lcl_to_roman_converter.
    cut = NEW #(  ).
    cl_abap_unit_assert=>assert_equals(  exp = 'I' act = cut->convert( arab_number ) ).
  ENDMETHOD.

ENDCLASS.

CLASS ltc_from_roman_converter DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      first_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_from_roman_converter IMPLEMENTATION.

  METHOD first_test.
    cl_abap_unit_assert=>assert_true(
      EXPORTING
        act = abap_true
*       msg =
*       level            = if_abap_unit_constant=>severity-medium
*       quit             = if_abap_unit_constant=>quit-test
*      RECEIVING
*       assertion_failed =
    ).
  ENDMETHOD.

ENDCLASS.
