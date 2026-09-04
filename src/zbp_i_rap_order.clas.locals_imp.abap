CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    " Method for Authorization Check
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Order RESULT result.

    " Method for setting default Status
    METHODS setInitialStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Order~setInitialStatus.
ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD get_instance_authorizations.
    " Standard shell for instance-level authorization.
    " For now, we allow all operations.
  ENDMETHOD.

  METHOD setInitialStatus.
    " 1. Read the newly created order(s)
    READ ENTITIES OF ZI_RAP_ORDER IN LOCAL MODE
      ENTITY Order
        FIELDS ( Status ) WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    " 2. Update the status to 'N' (New)
    MODIFY ENTITIES OF ZI_RAP_ORDER IN LOCAL MODE
      ENTITY Order
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR order IN orders
                      ( %tky   = order-%tky
                        Status = 'Unpaid' ) )
    REPORTED DATA(update_reported).

    " 3. Map reported data back to the framework
    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.

ENDCLASS.
