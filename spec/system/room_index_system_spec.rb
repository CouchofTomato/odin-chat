require 'rails_helper'

RSpec.describe "Room Index", type: :system do
  it 'shows a message to create a room when no rooms have been created' do
    visit root_path
    click_on 'Rooms'

    expect(page).to have_content "Please create a room to start chatting"
    expect(page).not_to have_selector('ul.menu-list')
  end
end
