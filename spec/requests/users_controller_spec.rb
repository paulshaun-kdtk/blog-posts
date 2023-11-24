require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  user = User.create(name: 'KDTK', bio: 'Graphic designer', photo: 'http://hello.com/org.png', posts_counter: 0)

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      user = user
      get :show, params: { id: user.id }
      expect(response).to be_successful
    end

    it 'assigns the requested user to @user' do
      user = user
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the show template' do
      user = user
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end
  end
end
