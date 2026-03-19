@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'restricted cds view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZORD_R_ORDERS as select from Zord_I_Orders
composition [0..*] of ZORD_R_ORDERITEM as _items
{
    key Orderid,
    Customerid,
    Orddate,
    Currency,
    @Semantics.amount.currencyCode: 'Currency'
    Amount,
    Status,
    Comments,
    Createdby,
    Createdat,
    Changedby,
    Changedat,
      _items // Make association public
}
