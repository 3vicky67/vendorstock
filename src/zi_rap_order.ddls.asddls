@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Header Interface View'
define root view entity ZI_RAP_ORDER 
  as select from zrap_order 
  composition [0..*] of ZI_RAP_ORD_ITEM as _Items
  association [0..1] to ZI_RAP_CUSTOMER as _Customer on $projection.CustId = _Customer.CustId
{
  key order_uuid as OrderUuid,
  order_id as OrderId,
  cust_id as CustId,
  total_amount as TotalAmount,
  currency as Currency,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_RAP_STATUS_VH', element: 'Status' } }]
  status as Status,
  case status
    when 'Paid'       then 3  // 3 = Green (Success)
    when 'Unpaid'     then 1  // 1 = Red (Error)
    when 'Processing' then 2  // 2 = Orange (Warning)
    else 0 
  end as StatusCriticality,
  // Add these inside the { } block
  vendor_group as VendorGroup,
  vendor_name  as VendorName,
  
  _Items,
  _Customer // Expose association
}
