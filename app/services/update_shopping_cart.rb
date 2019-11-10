class UpdateShoppingCart

  class Result < Struct.new(:success, :shopping_cart)
    def success?
      success == true
    end
  end

  def initialize(attributes:, shopping_cart:)
    @attributes = attributes
    @shopping_cart = shopping_cart
  end

  def call
    @shopping_cart.attributes = @attributes
    @shopping_cart.save!
    Result.new true, @shopping_cart
  rescue ActiveRecord::RecordInvalid => e
    Result.new false, @shopping_cart
  end

end