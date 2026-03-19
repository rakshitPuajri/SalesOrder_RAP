@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'order item Restricted cds view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZORD_R_ORDERITEM as select from ZORD_I_ORDERITEM
association to parent ZORD_R_ORDERS as _header
    on $projection.Orderid = _header.Orderid
{
    key Orderitemid,
    Orderid,
    Productname,
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
    _header // Make association public
}
