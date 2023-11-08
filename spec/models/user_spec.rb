require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
      expect(User.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'should validate numericality of posts_counter' do
      user = User.new(name: 'name', posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end

    it 'should be valid with correct attributes' do
      user = User.new(name: 'name', posts_counter: 0)
      expect(user).to be_valid
    end
  end

 
  describe '#recent_post' do
    let(:user) { create(:user) }
    let!(:old_post) { create(:post, author: user, created_at: 1.year.ago, text: 'Sample content') }

    let!(:recent_posts) { create_list(:post, 3, author: user, created_at: Time.now) }
  end
end