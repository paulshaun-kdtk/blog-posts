class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id' # Update this line
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true

  before_validation :set_timestamps

  private

  def set_timestamps
    self.created_at ||= Time.current
    self.updated_at = Time.current
  end
end
