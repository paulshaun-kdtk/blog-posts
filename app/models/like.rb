class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  before_create :set_created_at
  before_save :set_updated_at, :update_likes_counter

  def set_created_at
    self.created_at ||= Time.current
  end

  def set_updated_at
    self.updated_at = Time.current
  end

  def update_likes_counter
    post.update(likes_counter: post.likes.count + 1)
  end  
end
