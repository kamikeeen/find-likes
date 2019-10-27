class Genre < ActiveHash::Base
  self.data = [
      {id: 1, name: '映画'}, {id: 2, name: 'アニメ'}, {id: 3, name: '音楽'},
      {id: 4, name: '漫画'}, {id: 5, name: '食べ物'}, {id: 6, name: 'スポーツ'},
      {id: 7, name: 'その他'}
  ]
end