module ApplicationHelper

  def cart_count_over_one
    total_cart_items if total_cart_items > 0
  end

  def total_cart_items
    if @shopping_cart
      total = @shopping_cart.line_items.map(&:quantity).sum
      total if total > 0
    end
  end

end
