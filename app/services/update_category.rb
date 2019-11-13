class UpdateCategory

  class Result < Struct.new(:success, :category)
    def success?
      success == true
    end
  end

  def initialize(attributes:, category:)
    @attributes = attributes
    @category = category
  end

  def call
    @category.attributes = @attributes
    @category.save!
    Result.new true, @category
  rescue ActiveRecord::RecordInvalid => e
    Result.new false, @category
  end

end
