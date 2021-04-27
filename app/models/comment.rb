class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  STATUS_VALUES = ["バカ", "死ね", "アホ"]

  validates :text, exclusion: { in: STATUS_VALUES }
end
