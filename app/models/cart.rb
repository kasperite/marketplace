class Cart < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :products, through: :carts_products

  def add(product) 
    carts_product = CartsProduct.find_or_create_by(cart_id: self.id, product_id: product.id)
    carts_product.quantity += 1
    carts_product.save
  end
end
