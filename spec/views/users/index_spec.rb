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

  scenario 'I can see the number of posts each user has written' do
    expect(page).to have_content("Posts count: #{user1.recent_posts.count}")
    expect(page).to have_content("Posts count: #{user2.recent_posts.count}")
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    click_link user1.name
    expect(current_path).to eq(user_path(user1))
  end
end
