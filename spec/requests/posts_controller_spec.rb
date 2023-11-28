require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:author) { User.create(name: 'KDTK', bio: 'Graphic designer', photo: 'http://hello.com/org.png', posts_counter: 0) }
  let(:post_params) { { title: 'Test Post', text: 'This is a test post.', author_id: author.id, user_id: author.id } }
  let(:post) { Post.create(post_params) }
  puts('posts and author created successfully')

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all posts to @posts' do
      post # Create a post
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end

    it 'assigns the requested post to @post' do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end

    it 'assigns recent comments to @recent_comments' do
      get :show, params: { id: post.id }
      expect(assigns(:recent_comments)).to be_empty # Assuming there are no recent comments in this example
    end

    it 'renders the show template' do
      get :show, params: { id: post.id }
      expect(response).to render_template('show')
    end
  end
end
