class ProductsController < ApplicationController
  before_action :set_cart

  def index
    @products = Product.all
  end

  def add_to_cart
    if @product = Product.find(params[:product_id])
      @cart.add(@product)
    else
      # something
    end
    respond_to do |format|
      format.js
    end
  end

  def set_cart
    cookies[:cart_id] ||= SecureRandom.uuid
    @cart = Cart.find_or_create_by(identifier: cookies[:cart_id])
  end

end
