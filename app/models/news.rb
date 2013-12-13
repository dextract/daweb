class News < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: {maximum: 40 }
  validates :user_id, presence: true
end
