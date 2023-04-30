class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20, too_long: "は20文字以内にしてください"}
  validates :purpose, presence: true, length: { maximum: 50, too_long: "は50文字以内にしてください"}

  def created_by?(current_user)
    return false unless current_user
    user == current_user
  end
end
