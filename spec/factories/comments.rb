FactoryBot.define do
  factory :comment do
    association :user
    association :post
    text {'テキスト'}
  end
end
