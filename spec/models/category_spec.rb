require 'rails_helper'

RSpec.describe Category, type: :model do

  context "creation" do
    subject { build_stubbed :category }
    it { expect(subject.name).to eq "some_name" }
  end

  context "has validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(100).with_message "Name is too long" }
  end

  context "has associations" do
    it { should have_many :products }
  end

end
