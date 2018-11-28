FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence(6, true) }
    movie
    author
    created_at { Faker::Time.between(30.days.ago, Date.today }
  end
end
