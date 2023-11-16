# User Model
class User < ApplicationRecord
    has_many :posts
  end
  
  # Post Model
  class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes
  end
  
  # Comment Model
  class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
  end
  
  # Like Model
  class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
  end
  