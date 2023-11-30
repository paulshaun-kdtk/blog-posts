require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  let(:user) { create(:user) }
  let(:posts) { create_list(:post, 15, author: user, user_id: user.id) }

  before do
    assign(:user, user)
    assign(:posts, user.posts.paginate(page: 1, per_page: 10))
  end

  it 'displays the user information' do
    render
    expect(rendered).to have_selector("img[src='#{user.photo}']")
    expect(rendered).to have_content(user.name)
    expect(rendered).to have_content("Number of Posts: #{user.posts.count}")
  end

  it 'displays the pagination section' do
    render
    expect(rendered).to have_selector('.pagination')
  end

  it 'displays the "back to home" link' do
    render
    expect(rendered).to have_link('back to home', href: '/')
  end
end
