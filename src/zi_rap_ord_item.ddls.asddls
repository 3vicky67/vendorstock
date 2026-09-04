@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item Interface View'
define view entity ZI_RAP_ORD_ITEM 
  as select from zrap_ord_item as Item
  association to parent ZI_RAP_ORDER as _Order on $projection.OrderUuid = _Order.OrderUuid
  association [1..1] to ZI_RAP_PRODUCT as _Product on $projection.ProdId = _Product.ProdId
{
  key item_uuid as ItemUuid,
  order_uuid as OrderUuid,
  prod_id as ProdId,
  
  @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
  quantity as Quantity,
  
  unit_of_measure as UnitOfMeasure,

  _Order,
  _Product 
}
