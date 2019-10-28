class Like < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  has_many :user_likes
  has_many :users, through: :user_likes

  validates :name,  presence: true,
                    uniqueness: {scope: :genre_id, message: "すでに登録されています"},
                    length: { maximum: 40 }
                    
  validates :genre_id,  presence: true,
                        numericality:{only_integer: true,
                                      greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 8}
end
