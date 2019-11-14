10.times do
  Category.create!(
    name: Faker::Beer.brand
  )
end

20.times do
  Product.create!(
    name: Faker::Games::Dota.item,
    description: Faker::Games::Dota.quote,
    category: Category.order('RANDOM()').limit(1).first,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  )
end
