@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view orders'
@Metadata.ignorePropagatedAnnotations: true
define view entity Zord_I_Orders
  as select from zord_orders
{
  key orderid    as Orderid,
      customerid as Customerid,
      orddate    as Orddate,
      curr       as Currency,
      @Semantics.amount.currencyCode: 'Currency'
      amount     as Amount,
      status     as Status,
      comments   as Comments,
      createdby  as Createdby,
      createdat  as Createdat,
      changedby  as Changedby,
      changedat  as Changedat
}
