class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_timestamps

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end

  def recent_posts
    posts.where(author_id: id).order(created_at: :desc).limit(3)
  end  
end
