class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end
end
