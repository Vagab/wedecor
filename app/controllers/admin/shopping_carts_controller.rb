class Admin::ShoppingCartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    load_shopping_carts
  end

  def show
  end

  private

  def load_shopping_carts
    @shopping_carts = ShoppingCart.where(status: "submitted")
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end
end
