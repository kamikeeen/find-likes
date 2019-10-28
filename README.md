
# Name
Find-Likes

# Description
It is possible to find their new favorite.
(まだ知らないあなたの好きなことを見つけることができます。)

First, users register their favorite things.
Then, find a user with a common point.
What you like in common and what you don't register is likely to be your favorite

(ユーザーは自分の好きなことを登録します。すると、好きなことが同じユーザーが見つかります。
共通項が多いユーザーが登録している好きなことで、自分がまだ登録していないことは、あなたの好きなことになる可能性が高いものです。)


# DB設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/006f2544da29c26796b16b6d1c8264da.png)](https://gyazo.com/006f2544da29c26796b16b6d1c8264da)

## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|null: false|

### Associationv
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
