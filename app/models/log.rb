class Log < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true
end
