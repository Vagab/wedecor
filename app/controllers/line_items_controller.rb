class LineItemsController < ApplicationController
  include CurrentShoppingCart

  before_action :set_shopping_cart, only: [:create]

  def index
    load_line_items
  end

  def show
    load_line_item
  end

  def new
    build_line_item
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    result = CreateLineItem.new(shopping_cart: @shopping_cart, product: product).call
    if result.success?
      redirect_to result.line_item.shopping_cart
    else
      false
    end

  end

  def update
    #do something
  end

  def destroy
    load_line_item
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_cart_path(@shopping_cart), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def load_line_item
    @line_item = LineItem.find(params[:id])
  end

  def load_line_items
    @line_items = LineItem.all
  end

  def build_line_item
    @line_item = LineItem.new line_item_params
  end

  def line_item_params
    params.require(:line_item).permit(:product_id)
  end

end
