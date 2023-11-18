require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_presence_of(:text) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

    it 'should return a user\'s last 5 comments' do
      user = User.create(name: 'KDTK', bio: 'Graphic designer',
                         photo: 'http://hello.com/org.png', posts_counter: 0)
      post = Post.create(title: 'A new dawn', text: 'Software Developer', author_id: user.id, user_id: user.id)
  
      10.times.collect do
        Comment.create(text: 'Hello, world', author_id: user.id, post_id: post.id)
      end
  
      expect(post.recent_comments.length).to eq(5)
    end
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end
  describe '#update_posts_counter' do
    it 'updates the author\'s posts_counter by one' do
      user = User.create(
        name: 'John Doe',
        photo: 'example.jpg',
        bio: 'A short bio',
        posts_counter: 0
      )

      post = Post.create(
        title: 'A new dawn',
        text: 'Software Developer',
        author_id: user.id,
        user_id: user.id
      )

      # Ensure the post is saved before attempting to reload it
      user.reload

      # Expect the posts_counter of the author to be 1
      expect(user.posts_counter).to eq(1)
    end
  end
end
