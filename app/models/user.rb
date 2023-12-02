class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_timestamps, :set_default_values

  def set_timestamps
    self.created_at ||= Time.current unless persisted?
    self.updated_at = Time.current
  end

  def set_default_values
    self.posts_counter ||= 0
    self.name ||= nil
    self.photo ||= nil
    self.bio ||= nil
  end

  def recent_posts
    posts.where(author_id: id).order(created_at: :desc).limit(3)
  end
end
