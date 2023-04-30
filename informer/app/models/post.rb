class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 50 }
  validates :end_time, presence: true
end
