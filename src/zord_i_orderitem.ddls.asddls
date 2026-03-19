@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order item interface views'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZORD_I_ORDERITEM
  as select from zord_orderitems
{
  key orderitemid as Orderitemid,
      productname as Productname,
      orderid     as Orderid,
      unitfield   as Unitfield,
      @Semantics.quantity.unitOfMeasure: 'unitfield'
      quantity    as Quantity,
      currkyfield as Currkyfield,
      @Semantics.amount.currencyCode: 'Currkyfield'
      amount      as Amount,
      status      as Status,
      comments    as Comments,
      createdby   as Createdby,
      createdat   as Createdat,
      changedby   as Changedby,
      changedat   as Changedat
}
