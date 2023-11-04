class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
