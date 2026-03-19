@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view valuehelp cds for order status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZORD_C_ORDERSTATUS_VH
  as select from ZORD_I_ORDERSTATUS_VH
{
    @UI.hidden: true
  key domain_name,
@UI.hidden: true
  key value_position,
 @EndUserText.label: 'Order status'

      value_low, 
 @Consumption.filter.hidden: true
      text
}
