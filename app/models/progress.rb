class Progress < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1.悪かった' },
    { id: 3, name: '2.少し悪かった' },
    { id: 4, name: '3.普通' },
    { id: 5, name: '4.良かった' },
    { id: 6, name: '5.とても良かった' }
  ]
  include ActiveHash::Associations #アクティブハッシュを使うためのアソシエーション設定
  has_many :posts
end
