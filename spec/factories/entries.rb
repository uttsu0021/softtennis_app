FactoryBot.define do
  factory :entry do
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_kata         { 'ヤマダ' }
    first_name_kata        { 'タロウ' }
    postal_code            { '123-4567' }
    address                { '名古屋市緑区1-1' }
    phone                  { '09012345678' }
    group                  { '名古屋クラブ' }
    battle_record                 { '県大会4位' }
  end
end
