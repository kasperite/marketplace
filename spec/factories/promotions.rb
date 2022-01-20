FactoryBot.define do
  factory :promotion do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    threshold { rand(1000..5000) }
    discount_rate { 10 }
  end
end
