require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { build_stubbed :product }

  # it { should be_valid }

  it { expect(subject.name).to eq "some_product" }
  it { expect(subject.description).to eq "some_description" }
  it { expect(subject.price).to eq 0.0 }
  it { expect(subject.category_id).to eq 1 }

  context "has validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_length_of(:description).is_at_most(500).with_message 'Description is too long' }
    it { should validate_length_of(:name).is_at_most(100).with_message 'Name is too long' }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0).with_message 'Price can not be negative' }
  end

  context "has association" do
    it { should have_and_belong_to_many :shopping_carts }
    it { should have_many :line_items}
    it { should belong_to :category }
  end

end
