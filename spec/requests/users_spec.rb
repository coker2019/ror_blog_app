require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get users_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include('All Users')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      user = User.create!(name: 'Name', posts_counter: 0)
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User Profile')
      expect(response).to render_template(:show)
    end
  end
end
