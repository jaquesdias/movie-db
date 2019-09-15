FactoryBot.define do
  factory :movie do
    title { Faker::Name.name }
    description { Faker::Name.name }
    user
    category
  end
end
