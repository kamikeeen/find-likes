class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: '映画'}, {id: 2, name: 'アニメ'}, {id: 3, name: 'アーティスト'},
    {id: 4, name: '漫画'}, {id: 5, name: 'ブランド'}, {id: 6, name: 'スポーツ'},
    {id: 7, name: 'ゲーム'}, {id: 8, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :likes
end