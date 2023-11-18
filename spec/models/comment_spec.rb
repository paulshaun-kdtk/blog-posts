require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'example.jpg', bio: 'A short bio', posts_counter: 0) }
  let(:post) { Post.create(title: 'Post Title', text: 'Post Text', author_id: user.id, user_id: user.id) }

  it 'is valid with valid attributes' do
    comment = Comment.new(user:, post:, text: 'Valid comment text')
    expect(comment).to be_valid
  end

  it 'is not valid without text' do
    comment = Comment.new(user:, post:, text: nil)
    expect(comment).not_to be_valid
  end

  it 'sets timestamps before validation' do
    comment = Comment.new(user:, post:, text: 'Comment text')
    comment.valid?
    expect(comment.created_at).not_to be_nil
    expect(comment.updated_at).not_to be_nil
  end
  it 'updates the post comments_counter by one' do
    comment = Comment.create!(user: user, post: post, text: 'Comment text')
    post.reload
    expect(post.comments_counter).to eq(1)
  end  
end
