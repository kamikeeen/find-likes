class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: "User"

  varidates :user, presence: true
  varidates :follow, presence: true
end
