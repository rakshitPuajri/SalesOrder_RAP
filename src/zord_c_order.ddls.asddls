@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection or consumption view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZORD_C_ORDER
provider contract transactional_query
  as projection on ZORD_R_ORDERS
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
      /* Associations */
      _items : redirected to composition child ZORD_C_ORDERITEM
}
