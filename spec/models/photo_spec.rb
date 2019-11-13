require 'rails_helper'

RSpec.describe Photo, type: :model do
  context "has associations" do
    it { should belong_to :product }
  end
end
