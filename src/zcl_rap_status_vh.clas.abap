CLASS zcl_rap_status_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    " This interface allows the class to be executed via F9 in Eclipse
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_rap_status_vh IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: it_status TYPE TABLE OF zord_status.

    " Add our 3 status values
    it_status = VALUE #(
      ( status = 'P' description = 'Paid' )
      ( status = 'U' description = 'Unpaid' )
      ( status = 'O' description = 'Processing' )
    ).

    " Insert into database
    MODIFY zord_status FROM TABLE @it_status.

    out->write( 'Status data inserted successfully!' ).
  ENDMETHOD.

ENDCLASS.
