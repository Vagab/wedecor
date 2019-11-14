class CreateProduct

  class Result < Struct.new(:success, :product)
    def success?
      success == true
    end
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  def get_category_id
    category_name = @attributes['category_name']
    @attributes = @attributes.except :category_name
    category_id = Category.find_or_create_by(name: category_name).id
    @attributes['category_id'] =  category_id
  end

  def call
    get_category_id
    product = Product.new(@attributes)
    product.save!
    Result.new(true, product)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false)
  end

end
