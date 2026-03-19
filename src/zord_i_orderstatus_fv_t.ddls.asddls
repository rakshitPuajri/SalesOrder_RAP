@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'text for fixed value order status'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZORD_I_ORDERSTATUS_FV_T
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name:'Z_ORDSTATUS')
{
  key domain_name,
  key value_position,
  key language,
      value_low,
      text
}
