require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#bulma_class_for' do
    context 'when the type is success' do
      let(:type) { 'success' }

      it 'returns the Bulma is-success class' do
        expect(helper.bulma_class_for(type)).to eq 'is-success'
      end
    end

    context 'when the type is error' do
      let(:type) { 'error' }

      it 'returns the Bulma is-danger class' do
        expect(helper.bulma_class_for(type)).to eq 'is-danger'
      end
    end

    context 'when the type does not have an associated key' do
      let(:type) { 'kevins-bacon' }
      it 'returns the default value' do
        expect(helper.bulma_class_for(type)).to eq 'is_info'
      end
    end
  end
end
