require 'rails_helper'

RSpec.describe User, type: :model do

  subject { build_stubbed :user }

  context "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end


  it 'is not valid if password does not match password confirmation' do
    subject.password_confirmation = subject.password + 'yolo'
    expect(subject).to_not be_valid
  end

  context "wrong validations" do
    describe "wrong email" do
      subject { build :user, email: '@' }
      it { is_expected.to_not be_valid }
    end
  end

  describe "has association" do

    it { should have_one :shopping_cart }

  end

end
