require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # it { should validate_presence_of(:name) }
    # it { should validate_numericality_of(:post_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'Associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe '#recent_post' do
    let(:user) { create(:user) }
    let!(:old_post) { create(:post, author: user, created_at: 1.year.ago, text: 'Sample content') }

    let!(:recent_posts) { create_list(:post, 3, author: user, created_at: Time.now) }
  end
end
