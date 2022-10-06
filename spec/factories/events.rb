FactoryBot.define do
  factory :event do
    event               { 'イベント名' }
    category            { 'シングルス' }
    date                { '2000年01月01日' }
    prefectures         { '愛知県' }
    venue               { '名古屋市中央総合運動公園' }
    fee                 { '4000円' }
    deadline            { '2000年01月20日' }
    explanation         { '大会の説明'}

    after(:build) do |event|
      event.image.attach(io: File.open('public/images/top.png'), filename: 'top.png')
    end

    association :user
  end
end
