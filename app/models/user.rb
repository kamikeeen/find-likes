class User < ApplicationRecord
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader

  has_many :user_likes
  has_many :likes, through: :user_likes

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :user
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname,  presence: true,
                        length: { maximum: 8 }

  validates :avatar, presence: true
  
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  validates :password,  presence: true,
                        length: { minimum: 6 },
                        format: { with: VALID_PASSWORD_REGEX }

  validates :password_confirmation, presence: true

  scope :search_sort_with_ids, ->(ids) { where(id: ids).order(['field(id, ?)', ids]) }

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
