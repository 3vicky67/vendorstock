@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS  
define root view entity ZI_RAP_CUSTOMER as select from zrap_customer
{
    key cust_id as CustId,
    name as Name,
    email as Email,
    phone as Phone,
    city as City,
    country as Country,
@Semantics.systemDateTime.localInstanceLastChangedAt: true
local_last_changed_at as LocalLastChangedAt
}
