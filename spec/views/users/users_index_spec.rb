require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'index' do
    let(:user1) { User.create(name: 'Maurice', photo_link: 'photo_url', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let(:user2) { User.create(name: 'Ola', photo_link: 'photo_url_2', bio: 'Programmer', posts_counter: 0) }
    let(:user3) { User.create(name: 'Coker', photo_link: 'photo_url_3', bio: 'Consultant', posts_counter: 0) }

    let(:post4) do
      Post.create(title: 'Hello', text: 'How are you doing', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end
    let(:post3) do
      Post.create(title: 'Hi', text: 'How to stay strong', author_id: user1.id, comments_counter: 0, likes_counter: 0)
    end
    let(:post2) do
      Post.create(title: 'Health recipe', text: 'Eat balance diet', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end
    let(:post1) do
      Post.create(title: 'Energy', text: 'How to set the solar system', author_id: user1.id, comments_counter: 0,
                  likes_counter: 0)
    end

    before(:each) do
      user1
      user2
      user3
      visit users_path
    end

    it 'shows all users' do
      expect(page).to have_content('Maurice')
      expect(page).to have_content('Coker')
    end

    it 'display the photos for each user' do
      expect(page).to have_css("img[src*='photo_url']")
      expect(page).to have_css("img[src*='photo_url_2']")
    end

    it 'Display number of post' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'display number of posts for each user' do
      expect(page).to have_content("Number of posts: #{user1.posts.count}")
    end

    it 'Redirect to that user\'s show page on clicking a user' do
      click_link 'Coker', match: :first

      expect(page).to have_current_path(user_path(user3.id))
    end
  end
end
