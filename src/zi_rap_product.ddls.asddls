@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Interface View'
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS  
define root view entity ZI_RAP_PRODUCT as select from zrap_product
{
  key prod_id as ProdId,
  @Search.defaultSearchElement: true
  prod_name as ProdName,
  price as Price,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
  currency as Currency,
@Semantics.systemDateTime.localInstanceLastChangedAt: true
local_last_changed_at as LocalLastChangedAt
}
