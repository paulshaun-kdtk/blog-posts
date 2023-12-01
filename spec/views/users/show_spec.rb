require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  let(:user) { create(:user) }
  let!(:recent_posts) { create_list(:post, 3, author: user, user_id: user.id) }

  scenario 'User sees profile information and recent posts' do
    visit user_path(user)

    expect(page).to have_css("img[src*='#{user.photo}']", visible: :all)
    expect(page).to have_content("#{user.name} 's Profile")
    expect(page).to have_content("Number of Posts: #{user.posts.count}")
    expect(page).to have_content("Bio: #{user.bio}")

    recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_link(post.title, href: post_path(post))
      expect(page).to have_content(post.text)
      expect(page).to have_content('comments: likes:')
    end

    click_link('All Posts')
    expect(current_path).to eq(user_posts_path(user))
  end
end
