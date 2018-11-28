FactoryBot.define do
  factory :user, aliases: [:author] do
    name  { Faker::FunnyName.four_word_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    confirmed_at Time.zone.now
  end
end
