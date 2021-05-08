class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image #テーブルに画像ファイルを紐付け
  has_many :comments


  extend ActiveHash::Associations::ActiveRecordExtensions #アクティブハッシュを使うためのアソシエーション設定
  belongs_to :content
  belongs_to :information
  belongs_to :meeting_time #meeting_timeに_が抜けてエラーが出た
  belongs_to :person
  belongs_to :progress

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :title
    validates :text
    validates :content_id
    validates :meeting_time_id
    validates :progress_id
    validates :information_id
    validates :people_id
  end

  # 選択が「--」の時は保存できないようにする
  validates :content_id, :meeting_time_id, :progress_id, :information_id, :people_id, numericality: { other_than: 1 }
end
