class ApplicationController < ActionController::Base
  before_action :set_shopping_cart

  private

  def set_shopping_cart
    unless session[:shopping_cart_id]
      session[:shopping_cart_id] = ShoppingCart.create.id
    end
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
  end
end
