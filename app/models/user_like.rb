class UserLike < ApplicationRecord
  belongs_to :user
  belongs_to :like

  validates :user_id, uniqueness: {scope: :like_id, message: "すでに登録されています"} 

  scope :sort_desc_order, ->{group(:like_id).count.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }}

end
