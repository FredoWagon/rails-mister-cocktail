require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_url = open(url).read
ingredient_list = JSON.parse(ingredient_url)
ingredient = ingredient_list["drinks"]
list_ingredient = ingredient.map do |i|
  {name: i["strIngredient1"]}
end

list_ingredient

puts "Delete all instances"

Cocktail.destroy_all
puts "cocktail erase ok!"
Dose.destroy_all
puts "dose erase ok!"
Ingredient.destroy_all
puts "ingredient erase ok!"

Ingredient.create!(list_ingredient)
puts "Ingredient all ok !!"

Cocktail.create!({name: "Mojito"})
puts "mojito on!"

