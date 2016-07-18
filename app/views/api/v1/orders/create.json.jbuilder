if @order.valid?
    json.id @order.id
    json.quantity @order.quantity
    json.unit_price @order.product.price
    json.total @order.product.price * @order.quantity
    json.product @order.product.name
    json.user @order.user, :name, :email
else
  json.errors @order.errors
end