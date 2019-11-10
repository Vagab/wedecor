require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do

  context "has association" do

    it { should have_and_belong_to_many :products }
    it { should belong_to(:user).optional }
    it { should have_many :line_items}

  end

end