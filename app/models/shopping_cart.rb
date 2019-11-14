class ShoppingCart < ApplicationRecord

  belongs_to :user, optional: true
  has_and_belongs_to_many :products
  has_many :line_items, dependent: :destroy

  enum status: {
    not_submitted: 5,
    submitted: 10,
    approved: 20,
  }

end
