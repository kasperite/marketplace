class ProductsController < ApplicationController
  def index
    cookies[:cart_id] ||= SecureRandom.uuid
    @products = Product.all
    @cart = Cart.find_by(identifier: cookies[:cart_id])
  end

  def add_to_cart
    cookies[:cart_id] ||= SecureRandom.uuid
    @cart = Cart.find_or_create_by(identifier: cookies[:cart_id])
    if @product = Product.find(params[:product_id])
      @cart.add(@product)
    else
      # something
    end
    respond_to do |format|
      format.js
    end
  end
end
