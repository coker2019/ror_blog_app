require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end

  describe '#five_most_recent_comments' do
    let(:post) { create(:post) }
    let!(:old_comments) { create_list(:comment, 5, post:, created_at: 1.year.ago) }
    let!(:recent_comments) { create_list(:comment, 3, post:, created_at: Time.now) }
  end
end
