@EndUserText.label: 'Customer Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_RAP_CUSTOMER 
  provider contract transactional_query
  as projection on ZI_RAP_CUSTOMER
{
  key CustId,
  Name,
  Email,
  Phone,
  City,
  Country,
  LocalLastChangedAt
}
