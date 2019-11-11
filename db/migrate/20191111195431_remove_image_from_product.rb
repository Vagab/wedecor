class RemoveImageFromProduct < ActiveRecord::Migration[5.2]
  def up
    remove_attachment :products, :image
  end

  def down
    change_table :products do |t|
      t.attachment :image
    end
  end
end
