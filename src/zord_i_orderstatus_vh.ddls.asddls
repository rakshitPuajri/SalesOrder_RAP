@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'valuehelp for orderstatus'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZORD_I_ORDERSTATUS_VH
  as select from ZORD_I_ORDERSTATUS_FV 
  association [0..*] to ZORD_I_ORDERSTATUS_FV_T as _FixedvalueText on  $projection.value_position = _FixedvalueText.value_position
                                                                   and $projection.domain_name    = _FixedvalueText.domain_name
                                                                   and _FixedvalueText.language   = $session.system_language
{
  key ZORD_I_ORDERSTATUS_FV.domain_name,
  key ZORD_I_ORDERSTATUS_FV.value_position,
      ZORD_I_ORDERSTATUS_FV.value_low,
      _FixedvalueText.text
}
