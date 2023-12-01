require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user, user_id: user.id) }

  before do
    assign(:current_user, user)
    assign(:post, post)
  end

  it 'displays the post information' do
    render
    expect(rendered).to have_title(post.title)
    expect(rendered).to have_content("#{post.title} by #{post.author.name}")
    expect(rendered).to have_content("Likes: #{post.likes_count} , Comments: #{post.comments_count}")
    expect(rendered).to have_content(post.text)
  end

  it 'displays comments and commenters' do
    render
    post.ordered_comments.each do |comment|
      expect(rendered).to have_content("#{comment.user.name}: #{comment.text}")
    end
  end

  it 'displays the comment form' do
    render
    expect(rendered).to have_selector('.comment-form')
    expect(rendered).to have_field('comment_text')
  end

  it 'displays the like form' do
    render
    expect(rendered).to have_selector('.like-form')
  end

  it 'displays the "Back to All Posts" link' do
    render
    expect(rendered).to have_link('Back to All Posts', href: user_posts_path(post.author_id))
  end
end
