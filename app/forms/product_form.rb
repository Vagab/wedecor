class ProductForm

  include ActiveModel::Model

  attr_accessor :name, :description, :price, :category_name

  validates :name, :description, :price, presence: true

  validates_numericality_of :price,
                            greater_than_or_equal_to: 0.0,
                            message: 'Price can not be negative'
  validates_length_of :description,
                      maximum: 500,
                      message: 'Description is too long'
  validates_length_of :name,
                      maximum: 100,
                      message: 'Name is too long'

end
