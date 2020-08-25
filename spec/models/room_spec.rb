require 'rails_helper'

RSpec.describe Room, type: :model do
  before(:example) { Room.create(name: 'cry for help') }

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it do
      is_expected.to validate_length_of(:name)
        .is_at_least(4).is_at_most(20)
    end
  end
end
