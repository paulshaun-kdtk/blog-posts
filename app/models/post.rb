class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_timestamps

  after_save :update_posts_counter

  WillPaginate.per_page = 10

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end

  def likes_count
    likes.count
  end

  def comments_count
    comments.count
  end

  def ordered_comments
    comments.order(created_at: :asc)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
