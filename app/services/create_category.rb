class CreateCategory

  class Result < Struct.new(:success, :category)
    def success?
      success == true
    end
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    return Result.new false if Category.find_by(name: @attributes[:name])
    category = Category.new(@attributes)
    category.save!
    Result.new true, category
  rescue ActiveRecord::RecordInvalid => e
    Result.new false
  end

end
