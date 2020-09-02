require 'rails_helper'

RSpec.describe "NewRooms", type: :system do
  before(:example) { login_user }

  context 'when valid parameters are submitted through the form' do
    it 'informs the user that the room was successfully created' do
      visit root_path
      click_on "Rooms"

      click_on "Create Room"

      fill_in 'room_name', with: 'I miss MySpace'
      click_on "Create Room"

      expect(page).to have_selector '.is-success'
      expect(page).to have_content "Room Successfully Created"
    end
  end

  context 'when invalid parameters are submitted through the form' do
    it 'informs the user that the room could not be created and lists the errors' do
      visit root_path
      click_on "Rooms"

      click_on "Create Room"

      fill_in 'room_name', with: ('x' * 21)
      click_on "Create Room"

      expect(page).to have_selector '.is-danger'
      expect(page).to have_content "Room could not be created"
      expect(page).to have_content "Name is too long (maximum is 20 characters)"
    end
  end
end
