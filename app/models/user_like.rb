class UserLike < ApplicationRecord
  belongs_to :user
  belongs_to :like

  validates :user_id, uniqueness: {scope: :like_id, message: "すでに登録されています"} 
end
