# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Racetrack.destroy_all
UserDeck.destroy_all
Answer.destroy_all
Question.destroy_all
Deck.destroy_all
User.destroy_all

# add avatar to each user. need username!

user_1 = User.create!(email:"marcelo@live.com", password:"123456" ,first_name:"Marcelo", last_name:"User", username: "marcelovsk1")
user_1.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/marcelo_kiroir.jpg"), filename: "user_1.png", content_type: "image/png")

user_2 = User.create!(email:"justin@live.com", password:"123456" ,first_name:"Justin", last_name:"User", username: "justincredible")
user_2.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/justin_dkrsph.jpg"), filename: "user_2.png", content_type: "image/png")

user_3 = User.create!(email:"grant@live.com", password:"123456" ,first_name:"Grant", last_name:"User", username: "boyCapel")
user_3.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/grant_gbqxfk.jpg"), filename: "user_3.png", content_type: "image/png")

user_4 = User.create!(email:"kitty@live.com", password:"123456" ,first_name:"Kitty", last_name:"User", username: "hello_kitty123")
user_4.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693423131/b7qgeg70ut2b7hvqqyxp.png"), filename: "user_4.png", content_type: "image/png")
user_4.save

user_5 = User.create!(email:"david@live.com", password:"123456" ,first_name:"David", last_name:"User", username: "davidwagon")
user_5.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693423130/wcsd5gataw9n12srxxbj.png"), filename: "user_5.png", content_type: "image/png")
user_5.save

deck_1 = Deck.create!(name: "STRING", tips: "Strings are text that exist within either single quotes or double quotes. You create a string by enclosing a sequence of characters in one or the other.", level: 1)
deck_2 = Deck.create!(name: "INTEGER", tips: "Numbers without decimal points are called integers. Example: 2.5", level: 1)
deck_3 = Deck.create!(name: "FLOAT", tips: "Numbers with decimal points are called floating-point numbers or floats. Example: 1.3", level: 1)
deck_4 = Deck.create!(name: "ARRAY", tips: "check lecture", level: 1)
deck_5 = Deck.create!(name: "RANGE", tips: "check lecture", level: 1)
deck_6 = Deck.create!(name: "SPECIAL VALUES", tips: "check lecture", level: 1)
deck_7 = Deck.create!(name: "VARIABLES", tips: "check lecture", level: 1)
deck_8 = Deck.create!(name: "ASSIGNING", tips: "check lecture", level: 1)
deck_9 = Deck.create!(name: "REASSIGNING", tips: "check lecture", level: 1)

question_1 = Question.create!(content: "What do you have to include when you create a string?", deck: deck_1)
answer_1 = Answer.create!(content: "Quotation Marks", question: question_1, right_answer: true)
answer_2 = Answer.create!(content: "Curly Braces", question: question_1)
answer_3 = Answer.create!(content: "Parentheses", question: question_1)

question_2 = Question.create!(content: "Which one is a string?", deck: deck_1)
answer_5 = Answer.create!(content: '"Ruby"', question: question_2, right_answer: true)
answer_6 = Answer.create!(content: "Ruby", question: question_2)
answer_7 = Answer.create!(content: "ruby-string", question: question_2)

question_3 = Question.create!(content: "Where do you position the quotation marks in a string?", deck: deck_1)
answer_9 = Answer.create!(content:  "Before & After", question: question_3, right_answer: true)
answer_10 = Answer.create!(content: "Before", question: question_3)
answer_11 = Answer.create!(content: "After", question: question_3)

question_4 = Question.create!(content: "Which string has a length of 4 characters?", deck: deck_1)
answer_13 = Answer.create!(content: '"ruby"', question: question_4, right_answer: true)
answer_14 = Answer.create!(content: '"ruben"', question: question_4)
answer_15 = Answer.create!(content: '"4"', question: question_4)

question_5 = Question.create!(content: "Which method transforms a number into a string?", deck: deck_1)
answer_17 = Answer.create!(content: "100.to_s", question: question_5, right_answer: true)
answer_18 = Answer.create!(content: "100 = string", question: question_5)
answer_19 = Answer.create!(content: "100_become_string", question: question_5)

deck_1_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_2_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_3_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_4_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_5_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_6_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_7_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_8_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_9_level_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)

question_6 = Question.create!(content: "What is an integer?", deck: deck_2)
answer_21 = Answer.create!(content: "Number", question: question_6, right_answer: true)
answer_22 = Answer.create!(content: "Word", question: question_6)
answer_23 = Answer.create!(content: "Sentence", question: question_6)

question_7 = Question.create!(content: "How do you define an integer?", deck: deck_2)
answer_25 = Answer.create!(content: "Whole Number", question: question_7, right_answer: true)
answer_26 = Answer.create!(content: "Decimal Number", question: question_7)
answer_27 = Answer.create!(content: "2.1?", question: question_7)

question_8 = Question.create!(content: "Select the integer.", deck: deck_2)
answer_29 = Answer.create!(content:  "15", question: question_8, right_answer: true)
answer_30 = Answer.create!(content: "'wagon'", question: question_8)
answer_31 = Answer.create!(content: "3.14", question: question_8)

question_9 = Question.create!(content: "How can you check if number 100 is even?", deck: deck_2)
answer_33 = Answer.create!(content: "100.even?", question: question_9, right_answer: true)
answer_34 = Answer.create!(content: "100=even?", question: question_9)
answer_35 = Answer.create!(content: "100 + even?", question: question_9)

question_10 = Question.create!(content: "Is the number 3.14 an integer?", deck: deck_2)
answer_37 = Answer.create!(content: "No", question: question_10, right_answer: true)
answer_38 = Answer.create!(content: "Yes", question: question_10)
answer_39 = Answer.create!(content: "Only when it is even", question: question_10)

deck_1_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_2_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_3_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_4_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_5_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_6_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_7_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_8_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_9_level_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)

question_11 = Question.create!(content: "What is a float?", deck: deck_3)
answer_41 = Answer.create!(content: "Number", question: question_11, right_answer: true)
answer_42 = Answer.create!(content: "Word", question: question_11)
answer_43 = Answer.create!(content: "Text", question: question_11)

question_12 = Question.create!(content: "Is 378 a float?", deck: deck_3)
answer_45 = Answer.create!(content: "No", question: question_12, right_answer: true)
answer_46 = Answer.create!(content: "Yes", question: question_12)
answer_47 = Answer.create!(content: "Only if odd", question: question_12)

question_13 = Question.create!(content: "Does a float contain a decimal point?", deck: deck_3)
answer_49 = Answer.create!(content:  "Yes", question: question_13, right_answer: true)
answer_50 = Answer.create!(content: "No", question: question_13)
answer_51 = Answer.create!(content: "Sometimes", question: question_13)

question_14 = Question.create!(content: "Choose the float.", deck: deck_3)
answer_53 = Answer.create!(content: "34.4", question: question_14, right_answer: true)
answer_54 = Answer.create!(content: "344", question: question_14)
answer_55 = Answer.create!(content: "0", question: question_14)

question_15 = Question.create!(content: "How do you print a float ?", deck: deck_3)
answer_57 = Answer.create!(content: "puts 3.13", question: question_15, right_answer: true)
answer_58 = Answer.create!(content: "puts 365", question: question_15)
answer_59 = Answer.create!(content: 'puts "wagon"', question: question_15)

deck_1_multiplayer = Deck.create!(name: "Floats", tips: "check lecture", level: 100)
deck_2_multiplayer = Deck.create!(name: "Boolean", tips: "check lecture", level: 100)
deck_3_multiplayer = Deck.create!(name: "Integers", tips: "check lecture", level: 100)
deck_4_multiplayer = Deck.create!(name: "Arrays", tips: "check lecture", level: 100)
deck_5_multiplayer = Deck.create!(name: "Variables", tips: "check lecture", level: 100)

question_16 = Question.create!(content: "Will dividing one integer by another integer give you a float?", deck: deck_1_multiplayer)
answer_60 = Answer.create!(content: "Never", question: question_16, right_answer: true)
answer_61 = Answer.create!(content: "Sometimes", question: question_16)
answer_62 = Answer.create!(content: "Always", question: question_16)

question_17 = Question.create!(content: "If you divide 4 by 3, is the result a float?", deck: deck_1_multiplayer)
answer_63 = Answer.create!(content: "Yes", question: question_17)
answer_64 = Answer.create!(content: "No", question: question_17, right_answer: true)
answer_65 = Answer.create!(content: "Sometimes", question: question_17)

question_18 = Question.create!(content: "All floats contain a ____", deck: deck_1_multiplayer)
answer_63a = Answer.create!(content: "url", question: question_18)
answer_64b = Answer.create!(content: "fraction", question: question_18)
answer_65c = Answer.create!(content: "decimal point", question: question_18, right_answer: true)

question_19 = Question.create!(content: "Choose the float.", deck: deck_1_multiplayer)
answer_66 = Answer.create!(content: "Rootbeer", question: question_19)
answer_67 = Answer.create!(content: "3.14", question: question_19, right_answer: true)
answer_68 = Answer.create!(content: "25", question: question_19)

question_20 = Question.create!(content: "Is rootbeer a float?", deck: deck_1_multiplayer)
answer_69 = Answer.create!(content: "No", question: question_20, right_answer: true)
answer_70 = Answer.create!(content: "5", question: question_20)
answer_71 = Answer.create!(content: "Yum", question: question_20)
