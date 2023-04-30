class Contact < ApplicationRecord
  validates :content, presence: true, length: {maximum: 500, too_long: "は500文字以内で入力してください"}
end
