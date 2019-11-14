require 'rails_helper'

RSpec.describe CategoryForm, type: :model do

  subject { CategoryForm.new() }

  context "has validation" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(100).with_message 'Name is too long' }
  end

end
