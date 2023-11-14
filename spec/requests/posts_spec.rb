require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      user = User.create!(name: 'Name', posts_counter: 0)
      get user_posts_path(user_id: user.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('All Posts by a Given User')
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      user = User.create!(name: 'Name', posts_counter: 0)
      post = Post.create!(title: 'Post Title', author_id: user.id, comments_counter: 0, likes_counter: 0)
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Single Post')
      expect(response).to render_template(:show)
    end
  end
end
