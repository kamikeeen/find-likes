class Like < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  has_many :user_likes
  has_many :users, through: :user_likes

  validates :name,  presence: true,
                    length: { maximum: 40 }

  validates :genre,  presence: true

  scope :search_sort_with_ids, ->(ids) { where(id: ids).order(['field(id, ?)', ids]) }

  def sorted_same_likes_users(current_user)
    user_like_ids = current_user.likes.ids
    same_likes = {}
    self.users.each do |follow_user|
      same_likes_array = follow_user.likes.ids & user_like_ids
      same_likes[follow_user.id] = same_likes_array.length
    end
    same_likes = same_likes.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }
  end


end
