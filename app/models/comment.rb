class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  validates :text, presence: true

  before_validation :set_timestamps
  before_save :update_comments_counter

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end

  def update_comments_counter
    post.update(comments_counter: post.comments.count + 1)
  end
end
