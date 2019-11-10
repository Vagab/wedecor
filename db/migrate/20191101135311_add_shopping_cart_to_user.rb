class AddShoppingCartToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :shopping_cart, index: true
  end
end
