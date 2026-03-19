CLASS zcl_order_data_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      generate_order_data,
      generate_orderitem_data.
ENDCLASS.



CLASS ZCL_ORDER_DATA_INSERT IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Delete existing entries in the database tables to avoid duplicates
    DELETE FROM zord_orderitems.
    DELETE FROM zord_orders.

    " Create order test data
    generate_order_data( ).

    " Create order items test data
    generate_orderitem_data( ).

    out->write( 'Order test data has been successfully generated!' ).
  ENDMETHOD.


  METHOD generate_order_data.
    " Define internal table for orders
    DATA: lt_orders TYPE STANDARD TABLE OF zord_orders WITH KEY orderid.

    " Example customer IDs - replace with actual customer IDs from your system
    DATA(lv_customer_id1) = '00505601D4521EDBA7E66FC7B8587F10'.
    DATA(lv_customer_id2) = '00505601D4521EDBA7E66FC7B8587F11'.
    DATA(lv_customer_id3) = '00505601D4521EDBA7E66FC7B8587F12'.
    DATA(lv_customer_id4) = '00505601D4521EDBA7E66FC7B8587F13'.
    DATA(lv_customer_id5) = '00505601D4521EDBA7E66FC7B8587F14'.

    GET TIME STAMP FIELD DATA(ts).

    " Fill internal table with sample order data
    lt_orders = VALUE #(
      ( orderid     = '00505601D4521EDBA7E66FC7B8587F20'
        customerid  = lv_customer_id1
        orddate   = '20250310'
        curr        = 'USD'
        amount      = '1250.75'
        status      = 'PRC'
        comments    = 'Standard processing for new customer'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderid     = '00505601D4521EDBA7E66FC7B8587F21'
        customerid  = lv_customer_id2
        orddate   = '20250308'
        curr        = 'EUR'
        amount      = '3420.50'
        status      = 'ONH'
        comments    = 'Waiting for additional payment verification'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderid     = '00505601D4521EDBA7E66FC7B8587F22'
        customerid  = lv_customer_id3
        orddate   = '20250305'
        curr        = 'GBP'
        amount      = '2180.25'
        status      = 'CMP'
        comments    = 'Order completed and shipped on time'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderid     = '00505601D4521EDBA7E66FC7B8587F23'
        customerid  = lv_customer_id4
        orddate   = '20250303'
        curr        = 'JPY'
        amount      = '78500.00'
        status      = 'CAN'
        comments    = 'Customer requested cancellation due to delay'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderid     = '00505601D4521EDBA7E66FC7B8587F24'
        customerid  = lv_customer_id5
        orddate   = '20250301'
        curr        = 'USD'
        amount      = '945.30'
        status      = 'PND'
        comments    = 'Awaiting payment confirmation from bank'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )
    ).

    " Insert data into the database table
    INSERT zord_orders FROM TABLE @lt_orders.
  ENDMETHOD.


  METHOD generate_orderitem_data.
    " Define internal table for order items
    DATA: lt_order_items TYPE STANDARD TABLE OF zord_orderitems WITH KEY orderitemid.

    GET TIME STAMP FIELD DATA(ts).

    " Fill internal table with sample order item data
    lt_order_items = VALUE #(
      " Items for Order 1
      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E01'
        orderid     = '00505601D4521EDBA7E66FC7B8587F20'
        productname = 'Premium Office Chair'
        unitfield   = 'EA'
        quantity    = '3.00'
        currkyfield   = 'USD'
        amount   = '175.25'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E02'
        orderid     = '00505601D4521EDBA7E66FC7B8587F20'
        productname = 'Ergonomic Keyboard'
        unitfield   = 'EA'
        quantity    = '5.00'
        currkyfield   = 'USD'
        amount   = '145.00'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      " Items for Order 2
      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E03'
        orderid     = '00505601D4521EDBA7E66FC7B8587F21'
        productname = 'Enterprise Server Hardware'
        unitfield   = 'EA'
        quantity    = '1.00'
        currkyfield   = 'EUR'
       amount   = '2850.50'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E04'
        orderid     = '00505601D4521EDBA7E66FC7B8587F21'
        productname = 'Network Switch 24-Port'
        unitfield   = 'EA'
        quantity    = '2.00'
        currkyfield   = 'EUR'
        amount   = '285.00'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      " Items for Order 3
      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E05'
        orderid     = '00505601D4521EDBA7E66FC7B8587F22'
        productname = 'Professional Monitor 27"'
        unitfield   = 'EA'
        quantity    = '4.00'
        currkyfield   = 'GBP'
        amount   = '420.25'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E06'
        orderid     = '00505601D4521EDBA7E66FC7B8587F22'
        productname = 'Wireless Mouse Premium'
        unitfield   = 'EA'
        quantity    = '8.00'
        currkyfield   = 'GBP'
        amount   = '62.50'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      " Items for Order 4
      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E07'
        orderid     = '00505601D4521EDBA7E66FC7B8587F23'
        productname = 'Office Desk Standing'
        unitfield   = 'EA'
        quantity    = '5.00'
        currkyfield   = 'JPY'
        amount   = '12500.00'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E08'
        orderid     = '00505601D4521EDBA7E66FC7B8587F23'
        productname = 'Document Scanner Professional'
        unitfield   = 'EA'
        quantity    = '1.00'
        currkyfield   = 'JPY'
        amount   = '16000.00'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      " Items for Order 5
      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E09'
        orderid     = '00505601D4521EDBA7E66FC7B8587F24'
        productname = 'Laser Printer Color'
        unitfield   = 'EA'
        quantity    = '1.00'
        currkyfield   = 'USD'
        amount   = '745.30'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )

      ( orderitemid = '00505601D4521EDBA7E66FC7B8587E10'
        orderid     = '00505601D4521EDBA7E66FC7B8587F24'
        productname = 'Toner Cartridge Set'
        unitfield   = 'EA'
        quantity    = '2.00'
        currkyfield   = 'USD'
        amount   = '100.00'
        createdby   = sy-uname
        createdat   = ts
        changedby = sy-uname
        changedat   = ts )
    ).

    " Insert data into the database table
    INSERT zord_orderitems FROM TABLE @lt_order_items.
  ENDMETHOD.
ENDCLASS.
