class UpdateProduct

  class Result < Struct.new(:success, :product)
    def success?
      success == true
    end
  end

  def initialize(attributes:, product:)
    @attributes = attributes
    @product = product
  end

  def call
    @product.attributes = @attributes
    @product.save!
    Result.new(true, @product)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false, @product)
  end

end
