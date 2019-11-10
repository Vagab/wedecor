class CreateShoppingCartsProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :shopping_carts, :products do |t|
      t.index :shopping_cart_id
      t.index :product_id
    end
  end
end
