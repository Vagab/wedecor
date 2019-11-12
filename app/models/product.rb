class Product < ApplicationRecord

  before_destroy :not_referenced_by_any_line_item

  validates :name, :description, :price, presence: true

  has_and_belongs_to_many :shopping_carts
  belongs_to :category
  has_many :line_items

  validates_numericality_of :price,
                            greater_than_or_equal_to: 0.0,
                            message: 'Price can not be negative'
  validates_length_of :description,
                      maximum: 500,
                      message: 'Description is too long'
  validates_length_of :name,
                      maximum: 100,
                      message: 'Name is too long'

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end


end
