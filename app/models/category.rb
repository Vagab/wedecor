class Category < ApplicationRecord

  validates :name, presence: true
  validates_length_of :name,
                      maximum: 100,
                      message: 'Name is too long'

  has_many :products
end
