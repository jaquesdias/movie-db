FactoryBot.define do
  factory :rating do
    rating_value { rand(0..5) }
    movie
    user
  end
end
