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

  it 'displays the post titles' do
    render
    user.posts.each do |post|
      expect(rendered).to have_content(post.title)
    end
  end

  it 'displays some of the post bodies' do
    render
    user.posts.each do |post|
      expect(rendered).to have_content(post.body.truncate(50))
    end
  end

  it 'displays the first comments on a post' do
    render
    user.posts.each do |post|
      post.comments.first(3).each do |comment|
        expect(rendered).to have_content(comment.body)
      end
    end
  end

  it 'displays the number of comments a post has' do
    render
    user.posts.each do |post|
      expect(rendered).to have_content("Comments: #{post.comments.count}")
    end
  end

  it 'displays the number of likes a post has' do
    render
    user.posts.each do |post|
      expect(rendered).to have_content("Likes: #{post.likes.count}")
    end
  end

  it 'redirects to the post\'s show page when clicking on a post' do
    render
    user.posts.each do |post|
      expect(rendered).to have_link(post.title, href: post_path(post))
    end
  end
end
