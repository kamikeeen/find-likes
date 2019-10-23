class Like < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  has_many :user_likes
  has_many :users, through: :user_likes

end
