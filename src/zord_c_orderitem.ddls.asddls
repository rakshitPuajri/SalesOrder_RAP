@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for order item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZORD_C_ORDERITEM
  as projection on ZORD_R_ORDERITEM
{
  key Orderitemid,
      Productname,
      Orderid,
      Unitfield,
      @Semantics.quantity.unitOfMeasure: 'Unitfield'
      Quantity,
      Currkyfield,
      @Semantics.amount.currencyCode: 'Currkyfield'
      Amount,
      Status,
      Comments,
      Createdby,
      Createdat,
      Changedby,
      Changedat,
      _header : redirected to parent ZORD_C_ORDER

}
