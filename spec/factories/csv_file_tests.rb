

FactoryBot.define do
  factory :csv_file_test do
    dish_name { Faker::Food.dish }
    dish_description { Faker::Lorem.sentence }
    dish_type { Faker::Lorem.word }
    allergens { Faker::Food.ingredient }
    Category { Faker::Lorem.word }
    Price { Faker::Commerce.price(range: 1.0..10.0) }
  end
end