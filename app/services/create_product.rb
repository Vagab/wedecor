class CreateProduct

  class Result < Struct.new(:success, :product)
    def success?
      success == true
    end
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    product = Product.new(@attributes)
    product.save!
    Result.new(true, product)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false)
  end

end
