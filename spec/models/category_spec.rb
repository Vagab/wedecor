require 'rails_helper'

RSpec.describe Category, type: :model do

  context "creation" do
    subject { build_stubbed :category }
    it { expect(subject.name).to eq "some_name" }
  end

  context "has associations" do
    it { should have_many :products }
  end

end
