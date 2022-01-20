class Cart < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :products, through: :carts_products

  def add(product) 
    carts_product = CartsProduct.find_or_create_by(cart_id: self.id, product_id: product.id)
    carts_product.quantity += 1
    carts_product.save
  end


  def total
    carts_products.inject(0) do |sum, carts_product| 
      sum + carts_product.quantity * carts_product.product.price
    end
  end

  def discounted_rate
    amount = total
    return 0.2 if amount > 100
    return 0.15 if amount > 50
    return 0.1 if amount > 10
    nil
  end

  def discounted_amount
    total * discounted_rate
  end
end
