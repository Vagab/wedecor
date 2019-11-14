require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { build_stubbed :product }

  it { expect(subject.name).to eq "some_product" }
  it { expect(subject.description).to eq "some_description" }
  it { expect(subject.price).to eq 0.0 }
  it { expect(subject.category_id).to eq 1 }

  context "has association" do
    it { should have_and_belong_to_many :shopping_carts }
    it { should have_many :line_items}
    it { should belong_to :category }
    it { should have_many :photos }
  end

end
