class Admin::CategoriesController < ApplicationController


  private

  def load_category
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def load_categories
    @categories = Category.all
  end

  def create_category
    result = CreateCategory.new(category_params).call
    if result.success?
      redirect_to admin_category_path(result.category), notice: 'Successfully added product'
    else
      false
    end
  end

  def destroy_category
    @category.destroy
    redirect_to admin_categories_path, notice: "Category successfully deleted"
  end

  def category_params
    return {} unless params[:category]

    params.require(:category)
          .permit(:name)
  end

end
