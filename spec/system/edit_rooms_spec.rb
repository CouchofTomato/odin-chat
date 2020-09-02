require 'rails_helper'

RSpec.describe "EditRooms", type: :system do
  before(:example) do
    Room.create(name: 'test room')
    login_user
  end

  context 'when a valid edit is made' do
    it 'informs the user that the room was successsfully updated' do
      visit root_path
      click_on "Rooms"

      click_on "edit-test-room"

      fill_in 'room_name', with: 'prod room'
      click_on 'Update Room'

      expect(page).to have_selector '.is-success'
      expect(page).to have_content 'Room successfully updated'
      expect(page).to have_content 'prod room'
      expect(page).not_to have_content 'test room'
    end
  end

  context 'when an invalid edit is made' do
    it 'informs the user the room change could not be made' do
      visit root_path
      click_on "Rooms"

      click_on "edit-test-room"

      fill_in 'room_name', with: ''
      click_on 'Update Room'

      expect(page).to have_selector('.is-danger')
      expect(page).to have_content('Room could not be updated')
      expect(page).to have_content('Name can\'t be blank')
      expect(page).to have_content('Name is too short (minimum is 4 characters)')
    end
  end
end
