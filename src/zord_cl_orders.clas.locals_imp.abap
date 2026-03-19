CLASS lhc_orderitems DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS valItemLimit FOR VALIDATE ON SAVE
      IMPORTING keys FOR OrderItems~valItemLimit.
    METHODS detOrderAmount FOR DETERMINE ON SAVE
      IMPORTING keys FOR OrderItems~detOrderAmount.

ENDCLASS.

CLASS lhc_orderitems IMPLEMENTATION.

  METHOD valItemLimit.

    READ ENTITIES OF ZORD_R_ORDERS IN LOCAL MODE
    ENTITY OrderItems
    ALL FIELDS WITH  CORRESPONDING #( keys )
    result data(lt_order_items).

*    READ header order number from item number
    data(ordHeader_num) = VALUE #( lt_order_items[ 1 ]-Orderid  OPTIONAL ).

    READ ENTITIES OF ZORD_R_ORDERS IN LOCAL MODE
    ENTITY Order by \_items
    ALL FIELDS WITH VALUE #( ( %tky-Orderid = ordHeader_num  ) )
    result data(lt_total_orderItems).

    IF LINES( lt_total_orderItems ) > 2.
    failed-order = value #(  base failed-order ( %tky-Orderid = ordheader_num ) ).
    reported-order = value #( base reported-order ( %tky-Orderid = ordheader_num
                                                    %msg = new_message_with_text( text = 'Order item is greater than 2' ) ) ).
    ENDIF.


  ENDMETHOD.

  METHOD detOrderAmount.
  READ ENTITIES OF ZORD_R_ORDERS IN LOCAL MODE
  ENTITY OrderItems
  ALL FIELDS with CORRESPONDING #( KEYS  )
  RESULT data(lt_order_items).

  data(orderid) = VALUE #( lt_order_items[ 1 ]-Orderid ).

  READ ENTITIES OF ZORD_R_ORDERS IN LOCAL MODE
  ENTITY Order by \_items
   FIELDS ( Quantity  Amount ) WITH VALUE #( ( %tky-Orderid = orderid ) )
  RESULT DATA(lt_total_items).

  DATA(total_amount) = 0.
  LOOP AT lt_total_items INTO DATA(lv_lineitem).

  total_amount = total_amount + ( lv_lineitem-Quantity * lv_lineitem-Amount ).

  ENDLOOP.


  MODIFY ENTITIES OF ZORD_R_ORDERS IN LOCAL MODE
  ENTITY Order
  UPDATE SET FIELDS WITH VALUE #( ( %tky-Orderid = orderid  Amount = total_amount ) )
  FAILED data(failed_u)
  reported data(repoerted_u).



  ENDMETHOD.

ENDCLASS.

CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Order RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Order RESULT result.

ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
