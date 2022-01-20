class Calculator
  attr_reader :cart_price, :promotion, :total

  def initialize(cart)
    @cart = cart
  end

  def run
    calculate_cart_price
    find_promotion
    calculate_total
  end

  private 

  def calculate_cart_price
    @cart_price = @cart.carts_products.inject(0) do |sum, carts_product| 
      sum + carts_product.quantity * carts_product.product.price
    end
  end

  def find_promotion
    @promotion =  if @cart_price == 0
                    nil
                  else
                    Promotion.active.where("threshold < ?", @cart_price).order(threshold: :desc).first
                  end  
  end

  def calculate_total
    @total =  if @promotion.nil?
                @cart_price
              else
                ((@cart_price.to_f * (100 - @promotion.discount_rate)) / 100).round
              end
  end
end