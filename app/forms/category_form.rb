class CategoryForm

  include ActiveModel::Model

  attr_accessor :name

  validates :name, presence: true
  validates_length_of :name,
                      maximum: 100,
                      message: 'Name is too long'


end
