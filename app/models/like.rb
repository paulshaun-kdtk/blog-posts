class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

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
