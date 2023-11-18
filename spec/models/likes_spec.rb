require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe', photo: 'example.jpg', bio: 'A short bio', posts_counter: 0) }
  let(:post) { Post.create(title: 'Post Title', text: 'Post Text', author_id: 1) }

  it 'is valid with valid attributes' do
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end

  it 'sets timestamps before creation' do
    like = Like.create(user:, post:)
    expect(like.created_at).not_to be_nil
    expect(like.updated_at).not_to be_nil
  end
end
