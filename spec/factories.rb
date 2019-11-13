FactoryBot.define do

  factory :product do
    name  { "some_product" }
    description { "some_description" }
    price { 0.0 }
    category_id { 1 }
  end

  factory :user do
    email  { "example@example.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end

  factory :category do
    name { "some_name" }
  end

end
