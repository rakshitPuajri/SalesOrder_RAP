@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'order status fixed value'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZORD_I_ORDERSTATUS_FV
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE (p_domain_name :'Z_ORDSTATUS')
{
  key domain_name,
  key value_position,
      value_low
}
