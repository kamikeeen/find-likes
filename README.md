
# DB設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/1469cb359e7361805f73e2742b1001c3.png)](https://gyazo.com/1469cb359e7361805f73e2742b1001c3)

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

### Association
- has_many :user_likes
- has_many :users, through: :user_likes

## User_likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|like_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :like
