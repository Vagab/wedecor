require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test 'create_product_without_title_or_description' do
    product = Product.new
    assert_not product.save,
               'Can not create product without title or description'
  end

  # test "create_product_without_title" do
  #   product = Product.new(description: "Hello world")
  #   assert_equal product.description, "Hello world"
  # end


end
