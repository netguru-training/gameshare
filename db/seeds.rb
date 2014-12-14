10.times do Category.create(
  name: Faker::Lorem.word
) end

30.times.each do
  user = User.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    age: rand(10..80),
    password: '12345678',
    password_confirmation: '12345678'
  )

  game = Game.create(
    title: Faker::Product.product_name,
    description: Faker::Lorem.sentence,
    disk_condition: ['poor', 'good','mint'].sample,
    box_condition: ['brand_new', 'used'].sample
  )

  5.times.each do
    category = Category.take

    unless game.categories.include?(category)
      game.categories << category
    end
  end

  possession = Possession.create(
    user_id: user.id,
    game_id: game.id,
    type: ['WishlistItem', 'GameCollectionItem'].sample
  )
end
