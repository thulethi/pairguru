FactoryBot.define do
  factory :user, aliases: [:author] do
    name  { Faker::FunnyName.four_word_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    confirmed_at Time.zone.now

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, rand(3..30), :last_week, author: user
      end
    end
  end
end
