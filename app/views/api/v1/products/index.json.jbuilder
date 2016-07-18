json.array! @products do |product|
  json.name product.name
  json.price product.price
  json.discount product.discount
  json.slug product.friendly_id
  json.image product.main_image.path if ! product.main_image.nil?
end