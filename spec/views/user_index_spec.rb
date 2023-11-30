require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before do
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'I can see the profile picture for each user' do
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_css("img[src*='#{user2.photo}']")
  end
  end
end