class CreateLineItem

  class Result < Struct.new :success, :line_item
    def success?
      success == true
    end
  end

  def initialize(shopping_cart:, product:)
    @shopping_cart = shopping_cart
    @product = product
  end

  def add_product(product)
    current_item = @shopping_cart.line_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = @shopping_cart.line_items.build(product_id: product.id)
    end
    current_item
  end

  def call
    line_item = add_product(@product)
    line_item.save
    Result.new true, line_item
  rescue ActiveRecord::RecordInvalid => e
    Result.new false
  end

end
