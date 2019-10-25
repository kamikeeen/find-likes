
# DB設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/3d4a077a268e8297ff182c8fbf29a580.png)](https://gyazo.com/3d4a077a268e8297ff182c8fbf29a580)

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|null: false|

### Association
- has_many :likes, through: :user_likes
- has_many :user_likes
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

## Relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|follow_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :follow, class_name: "User"

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
|genre_id|integer|null: false|

### Association
- has_many :user_likes
- has_many :users, through: :user_likes
- belongs_to :genre

## User_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|like_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :like
