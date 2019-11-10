require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  describe 'create' do
    subject { build_stubbed :product }
    it { expect(subject).not_to be nil }
  end

  context 'update and destroy' do

    subject { build :product, name: "a", description: "b" }

    describe '#update' do
      it 'should update a product' do
        subject.update name: "ababa"
        expect(subject.name).to eq('ababa')
      end
    end

    describe '#destroy' do
      it 'should destroy a product' do
        subject.delete
        expect(subject.destroyed?).to eq(true)
      end
    end

  end


end