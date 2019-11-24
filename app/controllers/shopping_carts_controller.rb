class ShoppingCartsController < ApplicationController
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
  end

  def update
  end

  def destroy
    destroy_shopping_cart
  end

  # TODO: to separate controller
  def submit_cart
    if user_signed_in?
      SubmitCart.new(shopping_cart: @shopping_cart).call
      session[:shopping_cart_id] = nil
      redirect_to root_path, notice: "Order successfully submitted."
    else
      redirect_to new_user_session_path, alert: "You need to login first."
    end
  end

  private

  def build_shopping_cart
    @shopping_cart = ShoppingCart.new(shopping_cart_params)
  end

  def load_shopping_carts
    @shopping_carts = ShoppingCart.all
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
