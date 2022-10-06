FactoryBot.define do
  factory :user do
    nickname               { 'abc' }
    email                  { Faker::Internet.free_email }
    password               { 'aaa111' }
    password_confirmation  { password }
  end
end
