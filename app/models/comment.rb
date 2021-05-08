class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  STATUS_VALUES = ["バカ", "死ね", "アホ"]

  #空の投稿をできないようにする
  validates :text, presence: true, exclusion: { in: STATUS_VALUES }
end
