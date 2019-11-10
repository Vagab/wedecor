class ProductsController < ApplicationController

  def show
    load_product
  end

  def index
    load_products
  end

  private

  def load_product
    @product = Product.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

end
