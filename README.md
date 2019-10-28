
# アプリケーション
Find-Likes


# 概要
まだ知らないあなたの好きが見つかります！

ユーザーは自分の好きなもの「like」を登録することができます。
自分の「like」と同じものを登録しているユーザーは思考が似ていると言えます。
共通「like」が多いユーザーの「like」の中にまだ知らないだけの、あなた好みのものがあるはずです！


# Demo

## トップページ
[![Image from Gyazo](https://i.gyazo.com/bd0cedd256a97a2e81c136cf5c1dd059.gif)](https://gyazo.com/bd0cedd256a97a2e81c136cf5c1dd059)

## ユーザーページ
[![Image from Gyazo](https://i.gyazo.com/a659a25af632039918f0c34cebe82276.png)](https://gyazo.com/a659a25af632039918f0c34cebe82276)

## like詳細ページ
[![Image from Gyazo](https://i.gyazo.com/481c50e8b8df87970e92f4fd423ba559.png)](https://gyazo.com/481c50e8b8df87970e92f4fd423ba559)

## like作成ページ
[![Image from Gyazo](https://i.gyazo.com/36d97d089a40a0b65c0828ee3372c89a.gif)](https://gyazo.com/36d97d089a40a0b65c0828ee3372c89a)


# なぜ作ったのか？
世の中には素晴らしいものがたくさん生まれてきます。
それらの中から、私たちが出会えるものはいくつあるでしょうか？

何か面白い漫画や映画ないかな？
新しいアーティストを発掘したいな。
ふとこんなことを思うことはありませんか？

私は今までたくさんそういう場面がありました。
どうやって探したらいいんだろうとか、もっと早くこれを知りたっかったな！などなど

せっかく素晴らしいものが生まれてきているのなら、出会わなければもったいない！そんな思いからこのアプリケーションを作ることに決めました。


# 苦労した点
- rails6でのデプロイに苦労しました。rails5での開発・デプロイの経験はあったのですが、ローカル・本番での環境構築やmysqlの設定等の仕様が変わっていたため、苦労しました。

- ユーザーが自分のlikeを登録する時に、すでに誰かによって作成されているものは追加になりかつ、誰も登録していなければ新規に作成という分岐をどうするかで悩みました。

- ユーザー一覧の際に、自分のlikeと他ユーザーのlikeの共通個数を数え、多い順に並び替えたものが表示される仕様にするところも苦労しました。

# 今後実装していきたい
- ジャンルごとに人気のlikeをランキングでだす
- ジャンルの細分化
- ユーザーの登録likeをもとにおすすめlikeを表示させる
- なぜ好きなのかというコメントの登録、表示
- 気になるリストの作成
- ユーザーのマイブーム機能の追加



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
