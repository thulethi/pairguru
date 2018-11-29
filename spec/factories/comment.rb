FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence(6, true) }
    movie
    author
    created_at { Faker::Time.backward }

    trait :last_week do
      created_at { Faker::Time.between(1.week.ago, Date.today) }
    end
  end
end
