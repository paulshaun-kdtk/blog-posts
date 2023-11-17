class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :text, presence: true

  before_create :set_created_at
  before_save :set_updated_at

  private

  def set_created_at
    self.created_at ||= Time.current
  end

  def set_updated_at
    self.updated_at = Time.current
  end
end
