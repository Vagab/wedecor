require 'rails_helper'

RSpec.describe ProductForm, type: :model do

  subject { ProductForm.new() }

  context "has validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_length_of(:description).is_at_most(500).with_message 'Description is too long' }
    it { should validate_length_of(:name).is_at_most(100).with_message 'Name is too long' }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0).with_message 'Price can not be negative' }
  end

end
