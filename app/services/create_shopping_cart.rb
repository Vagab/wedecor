class CreateShoppingCart

  class Result < Struct.new(:success, :shopping_cart)
    def success?
      success == true
    end
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    shopping_cart = ShoppingCart.new(@attributes)
    shopping_cart.save!
    Result.new true, product
  rescue ActiveRecord::RecordInvalid => e
    Result.new false
  end

end