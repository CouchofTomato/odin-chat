require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :room_id }
    it { is_expected.to validate_presence_of :message }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :room }
  end

end
