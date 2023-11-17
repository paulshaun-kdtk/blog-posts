class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  before_validation :set_timestamps

  private

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
