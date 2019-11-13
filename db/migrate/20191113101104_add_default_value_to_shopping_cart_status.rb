class AddDefaultValueToShoppingCartStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :shopping_carts, :status, 5
  end
end
