# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "admin@example.com")
  User.create!(email: "admin@example.com", password: "password", admin: true)
  User.create!(email: "guest@example.com", password: "password")
end

["Shampoo", "Conditioner"].each do |name|
  unless Product.exists?(name: name)
    Product.create!(name: name, description: "A sample product about #{name}", price: 33.44)
  end
end
