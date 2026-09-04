@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Dropdown (Normal View)'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_RAP_STATUS_VH 
  as select from zord_status
{
  @ObjectModel.text.element: ['Description']
  @UI.lineItem: [{ position: 10 }]
  key status as Status,
  
  @UI.lineItem: [{ position: 20 }]
  description as Description
}
