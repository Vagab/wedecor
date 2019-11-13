class SubmitCart

  def initialize(shopping_cart:)
    @shopping_cart = shopping_cart
  end

  def call
    @shopping_cart.submitted!
  end
  
end
