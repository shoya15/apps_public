class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user

    validates :content, presence: true, length: { maximum: 500, too_long: "は500文字以内にしてください"}

    def created_by?(current_user)
        return false unless current_user
        user == current_user
    end
end
