@EndUserText.label: 'Order Item Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_RAP_ORD_ITEM 
  as projection on ZI_RAP_ORD_ITEM
{
  key ItemUuid,
  OrderUuid,
  
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_PRODUCT', element: 'ProdId' } }]
  ProdId,
  
  Quantity,
  
  @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UnitOfMeasure', element: 'UnitOfMeasure' } }]
  UnitOfMeasure,
  
  /* Associations */
  _Order : redirected to parent ZC_RAP_ORDER,
  _Product
}
