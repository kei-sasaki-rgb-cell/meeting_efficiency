class MeetingTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1.かかり過ぎた' },
    { id: 3, name: '2.少しかかった' },
    { id: 4, name: '3.普通' },
    { id: 5, name: '4.良かった' },
    { id: 6, name: '5.丁度良かった' }
  ]
  include ActiveHash::Associations #アクティブハッシュを使うためのアソシエーション設定
  has_many :posts
end
