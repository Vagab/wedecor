class Admin::ProductsController < AdminController

  def new
    build_product
  end

  def show
    load_product
  end

  def index
    load_products
  end

  def edit
    load_product
  end

  def update
    load_product
    update_product || render(:edit)
  end

  def create
    build_product
    create_product || render(:new)
  end

  def destroy
    load_product
    destroy_product
  end

  private

  def build_product
    @product = ProductForm.new(product_params)
  end

  def load_product
    @product = Product.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

  def product_params
    return {} unless params[:product_form]

    params.require(:product_form)
          .permit(:name, :description, :price, :category_name)
  end

  def create_product
    return false unless @product.valid?

    result = CreateProduct.new(attributes: product_params).call
    if result.success?
      redirect_to admin_product_path(result.product), notice: 'Successfully added product'
    else
      false
    end
  end

  def destroy_product
    @product.destroy
    redirect_to admin_products_path
  end

  def update_product
    result = UpdateProduct.new(attributes: product_params, product: @product)
                          .call
    if result.success?
      redirect_to admin_product_path(result.product)
    else
      false
    end
  end

end
