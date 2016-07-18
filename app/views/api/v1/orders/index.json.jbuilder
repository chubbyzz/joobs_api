json.array! @orders do |order|
  json.id order.id
  json.product order.product.name
  json.status order.status
  json.quantity order.quantity
  json.unit_price order.product.price
  json.total order.quantity * order.product.price
end
