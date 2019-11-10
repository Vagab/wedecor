require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  subject { User.new email: 'ex@ex.com', password: '123456', password_confirmation: '123456' }

  describe '#update' do
    it 'should update a product' do
      subject.first_name = 'ababa'
      expect(subject.first_name).to eq('ababa')
    end
  end

  describe '#destroy' do
    it 'should destroy a product' do
      subject.delete
      expect(subject.destroyed?).to eq(true)
    end
  end

end