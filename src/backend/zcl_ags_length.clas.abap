CLASS zcl_ags_length DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      encode
        IMPORTING iv_length     TYPE i
        RETURNING VALUE(rv_hex) TYPE zags_hex4,
      decode
        IMPORTING iv_data          TYPE string
        RETURNING VALUE(rv_length) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AGS_LENGTH IMPLEMENTATION.


  METHOD decode.

    DATA: lv_x TYPE x LENGTH 1.


    ASSERT strlen( iv_data ) >= 4.

* todo, extend implementation
    ASSERT iv_data(2) = '00'.

    lv_x = to_upper( iv_data+2 ).

    rv_length = lv_x.

  ENDMETHOD.                    "decode


  METHOD encode.

    DATA: lv_char    TYPE string,
          lv_xstring TYPE xstring,
          lv_x       TYPE x LENGTH 2.


    lv_x       = iv_length.
    lv_char    = lv_x.
    lv_xstring = zcl_ags_util=>string_to_xstring_utf8( to_lower( lv_char ) ).
    rv_hex     = lv_xstring.

  ENDMETHOD.                    "encode
ENDCLASS.
