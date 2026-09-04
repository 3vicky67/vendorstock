@EndUserText.label: 'Order Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_RAP_ORDER 
  provider contract transactional_query
  as projection on ZI_RAP_ORDER
{
  key OrderUuid,
  OrderId,
  
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_CUSTOMER', element: 'CustId' } }]
  CustId,
  
  
  TotalAmount,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
  Currency,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_STATUS_VH', element: 'Description' } }]
  Status,
   StatusCriticality,
  // Add these inside the { } block
  VendorGroup,
  VendorName,
  /* Associations */
  _Items : redirected to composition child ZC_RAP_ORD_ITEM,
  _Customer // Exposed for UI text mapping if needed
}
