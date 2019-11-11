class Admin::ShoppingCartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    load_shopping_carts
  end

  def show
  end

  def new
    build_shopping_cart
  end

  def edit
  end

  def create
    build_shopping_cart
    create_shopping_cart
  end

  def update
    update_shopping_cart
  end

  def destroy
    destroy_shopping_cart
  end

  private

  def build_shopping_cart
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
  end

  def load_shopping_carts
    @shopping_carts = ShoppingCart.all
  end

  def create_shopping_cart
    return false unless @shopping_cart.valid?

    result = CreateShoppingCart.new(attributes: shopping_cart_params).call
    if result.success?
      redirect_to shopping_cart_path(result.shopping_cart)
    else
      false
    end
  end

  def update_shopping_cart
    return false unless @shopping_cart.valid?

    result = UpdateShoppingCart.new(attributes: shopping_cart_params, shopping_cart: @shopping_cart)
    if result.success?
      redirect_to shopping_cart_path(result.shopping_cart)
    else
      false
    end
  end

  def destroy_shopping_cart
    @shopping_cart.destroy if @shopping_cart.id == session[:shopping_cart_id]
    session[:shopping_cart_id] = nil
    redirect_to root_path
  end

  def shopping_cart_params
    return {} unless params[:shopping_cart]

    params.require(:shopping_cart)
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path, notice: "That cart doesn't exist"
  end
end
