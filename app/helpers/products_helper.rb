module ProductsHelper
  def to_dollars(price)
    number_to_currency((price.to_f / 100), :unit => "$")
  end
end
