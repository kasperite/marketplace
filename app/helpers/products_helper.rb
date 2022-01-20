module ProductsHelper
  def to_dollars(price)
    number_to_currency((price.to_f / 100), unit: "$")
  end

  def render_cart_product(carts_product)
    content = "#{carts_product.product.name} - #{to_dollars(carts_product.product.price)}"
    content += " x #{carts_product.quantity}" if carts_product.quantity > 1
    content
  end
end
