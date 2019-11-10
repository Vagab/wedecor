require 'rails_helper'

RSpec.describe LineItem, type: :model do

  context "has associations" do

    it { should belong_to :shopping_cart }
    it { should belong_to :product}

  end

end
