class Information < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1.多すぎたもしくは少なすぎた' },
    { id: 3, name: '2.多かったもしくは少ない' },
    { id: 4, name: '3.普通' },
    { id: 5, name: '4.良かった' },
    { id: 6, name: '5.丁度良かった' }
  ]
  include ActiveHash::Associations #アクティブハッシュを使うためのアソシエーション設定
  has_many :posts
end
