FactoryGirl.define do
  factory :product do
    title { Faker::Name.name }
    price { Faker::Number.between(2500, 3000) }
    description { Faker::Lorem.paragraph }
  end
end