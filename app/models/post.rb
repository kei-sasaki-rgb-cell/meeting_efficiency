class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments


  extend ActiveHash::Associations::ActiveRecordExtensions #アクティブハッシュを使うためのアソシエーション設定
  belongs_to :content
  belongs_to :information
  belongs_to :meeting_time #meeting_timeに_が抜けてエラーが出た
  belongs_to :person
  belongs_to :progress

  # 選択が「--」の時は保存できないようにする
  validates :content_id, :meeting_time_id, :progress_id, :information_id, :people_id, numericality: { other_than: 1 }
end
