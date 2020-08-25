require 'rails_helper'

RSpec.describe "DeleteRooms", type: :system, js: true do
  before do
    Room.create(name: 'test room')
  end

  context 'when a valid delete is made' do
    it 'informs the user that the room was successfully deleted' do
      visit root_path
      click_on "Rooms"

      accept_confirm do
        click_on "delete-test-room"
      end

      expect(page).to have_selector 'is-success'
      expect(page).to have_content 'Room successfully deleted'
    end
  end
end
