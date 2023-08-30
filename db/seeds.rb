# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

user_1 = User.create!(email:"marcelo@live.com", password:"123456" ,first_name:"Marcelo", last_name:"User")

user_2 = User.create!(email:"justin@live.com", password:"123456" ,first_name:"Justin", last_name:"User")

user_3 = User.create!(email:"grant@live.com", password:"123456" ,first_name:"Grant", last_name:"User")

user_4 = User.create!(email:"kitty@live.com", password:"123456" ,first_name:"Kitty", last_name:"User")

user_5 = User.create!(email:"david@live.com", password:"123456" ,first_name:"David", last_name:"User")
