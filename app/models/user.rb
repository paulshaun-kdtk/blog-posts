class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true

  before_validation :set_timestamps

  private

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end
end
