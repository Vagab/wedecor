class Admin::CategoriesController < ApplicationController

  def new
    build_category
  end

  def show
    load_category
  end

  def index
    load_categories
  end

  def edit
    load_category
  end

  def update
    load_category
    update_category || render(:edit)
  end

  def create
    build_category
    create_category || render(:new)
  end

  def destroy
    load_category
    destroy_category
  end

  private

  def load_category
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def load_categories
    @categories = Category.all
  end

  def build_category
    @category = Category.new
  end

  def create_category
    result = CreateCategory.new(attributes: category_params).call
    if result.success?
      redirect_to admin_category_path(result.category), notice: 'Successfully added product'
    else
      false
    end
  end

  def update_category
    result = UpdateCategory.new(attributes: category_params, category: @category).call
    if result.success?
      redirect_to admin_category_path(result.category), notice: 'Category successfully updated'
    else

    end
  end

  def destroy_category
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category successfully deleted'
  end

  def category_params
    return {} unless params[:category]

    params.require(:category)
          .permit(:name)
  end

end
