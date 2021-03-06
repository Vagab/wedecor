class Product < ApplicationRecord

  before_destroy :not_referenced_by_any_line_item

  has_and_belongs_to_many :shopping_carts
  belongs_to :category
  has_many :line_items
  has_many :photos

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end


end
