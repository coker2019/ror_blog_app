require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe '#index' do
    before(:each) do
      @user = User.create(name: 'coker', bio: 'Teacher from Mexico. ', photo_link: 'photo',
                          posts_counter: 0)
      @post4 = Post.create(title: 'work', text: 'working on the blog app', author_id: @user.id, comments_counter: 0,
                           likes_counter: 0)

      @comment1 = Comment.create(text: 'How to be a software developer', user_id: @user.id, post_id: @post4.id)
      @comment2 = Comment.create(text: 'How to solve a crime', user_id: @user.id, post_id: @post4.id)
      @comment3 = Comment.create(text: 'Great post', user_id: @user.id, post_id: @post4.id)
      @comment4 = Comment.create(text: 'That is just awful', user_id: @user.id, post_id: @post4.id)
      @comment5 = Comment.create(text: 'Good post!', user_id: @user.id, post_id: @post4.id)
      @comment6 = Comment.create(text: 'Awesome stuff', user_id: @user.id, post_id: @post4.id)

      visit user_posts_path(@user)
    end
    it 'displays user information' do
      expect(page).to have_css('img')
      expect(page).to have_content('coker')
      expect(page).to have_content('Number of posts: 1')
    end

    it 'displays post information' do
      expect(page).to have_selector('body', text: 'work', visible: true)
      expect(page).to have_content('working on the blog app')
      expect(page).to have_content('likes: 0')
      expect(page).to have_content('comments: 6')
    end

    it 'display latest comments on a post' do
      expect(page).not_to have_content('How to be a software developer')
    end

    it 'redirects me to that post\'s show page when clicking on a post' do
      click_link('work')
      expect(page).to have_current_path(user_post_path(@user, @post4))
    end
  end
end
