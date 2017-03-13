10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end


user1 = User.create(email: "user1@mail.com", password:"user1@mail.com")
user2 = User.create(email: "user2@mail.com", password:"user2@mail.com")
user3 = User.create(email: "user3@mail.com", password:"user3@mail.com")