class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    validates :name, presence: true
    validates :photo, presence: true
    validates :bio, presence: true

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