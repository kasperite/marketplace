FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { rand(10..20) }
  end
end
