FactoryBot.define do
  factory :post do
    title {'タイトル'}
    text {'テキスト'}
    content_id { 2 }
    meeting_time_id { 2 }
    progress_id { 2 }
    information_id { 2 }
    people_id { 2 }
    association :user
  end
end
