# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
(1..3).each do |i|
  user = User.create(username: "User_#{i}", email: "user_#{i}@example.com")

  # Create expenses for each user
  (3..5).to_a.sample.times do
    user.expenses.create(description: "Expense #{Faker::Commerce.product_name}",
                         amount: Faker::Commerce.price(range: 10..100))
  end
end

puts "Users with expenses created successfully!"