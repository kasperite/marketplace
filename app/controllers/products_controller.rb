class ProductsController < ApplicationController
  before_action :set_cart

  def index
    @products = Product.all
    @calculator.run
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    @cart.add(product)
    @calculator.run
    
    respond_to do |format|
      format.js
    end
  end

  def set_cart
    cookies[:cart_id] ||= SecureRandom.uuid
    @cart = Cart.find_or_create_by(identifier: cookies[:cart_id])
    @calculator = Calculator.new(@cart)
  end

end
