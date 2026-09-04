@EndUserText.label: 'Product Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_RAP_PRODUCT 
  provider contract transactional_query
  as projection on ZI_RAP_PRODUCT
{
  key ProdId,
  ProdName,
  Price,
  Currency,
  LocalLastChangedAt
}
