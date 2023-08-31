# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
Answer.destroy_all
Question.destroy_all
Deck.destroy_all
User.destroy_all

user_1 = User.create!(email:"marcelo@live.com", password:"123456" ,first_name:"Marcelo", last_name:"User")
user_1.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/marcelo_kiroir.jpg"), filename: "user_1.png", content_type: "image/png")

user_2 = User.create!(email:"justin@live.com", password:"123456" ,first_name:"Justin", last_name:"User")
user_2.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/justin_dkrsph.jpg"), filename: "user_2.png", content_type: "image/png")

user_3 = User.create!(email:"grant@live.com", password:"123456" ,first_name:"Grant", last_name:"User")
user_3.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693430408/grant_gbqxfk.jpg"), filename: "user_3.png", content_type: "image/png")

user_4 = User.create!(email:"kitty@live.com", password:"123456" ,first_name:"Kitty", last_name:"User")
user_4.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693423131/b7qgeg70ut2b7hvqqyxp.png"), filename: "user_4.png", content_type: "image/png")
user_4.save

user_5 = User.create!(email:"david@live.com", password:"123456" ,first_name:"David", last_name:"User")
user_5.photo.attach(io: URI.open("https://res.cloudinary.com/ddpxdkwin/image/upload/v1693423130/wcsd5gataw9n12srxxbj.png"), filename: "user_5.png", content_type: "image/png")
user_5.save

deck_1 = Deck.create!(name: "STRINGS", tips: "check lecture", level: 1)
deck_2 = Deck.create!(name: "INTEGERS", tips: "check lecture", level: 1)
deck_3 = Deck.create!(name: "FLOATS", tips: "check lecture", level: 1)
deck_4 = Deck.create!(name: "ARRAYS 1", tips: "check lecture", level: 1)
deck_5 = Deck.create!(name: "ARRAYS 2", tips: "check lecture", level: 1)
deck_6 = Deck.create!(name: "RANGES", tips: "check lecture", level: 1)
deck_7 = Deck.create!(name: "VARIABLES 1", tips: "check lecture", level: 1)
deck_8 = Deck.create!(name: "VARIABLES 2", tips: "check lecture", level: 1)
deck_9 = Deck.create!(name: "LOGIC", tips: "check lecture", level: 1)

question_1 = Question.create!(content: "1+1", deck: deck_1)
answer_1 = Answer.create!(content: "2", question: question_1, right_answer: true)
answer_2 = Answer.create!(content: "1", question: question_1)
answer_3 = Answer.create!(content: "5", question: question_1)
answer_4 = Answer.create!(content: "8", question: question_1)

question_2 = Question.create!(content: "2+2", deck: deck_1)
answer_5 = Answer.create!(content: "4", question: question_2, right_answer: true)
answer_6 = Answer.create!(content: "1", question: question_2)
answer_7 = Answer.create!(content: "5", question: question_2)
answer_8 = Answer.create!(content: "8", question: question_2)

question_3 = Question.create!(content: "3+3", deck: deck_1)
answer_9 = Answer.create!(content:  "6", question: question_3, right_answer: true)
answer_10 = Answer.create!(content: "1", question: question_3)
answer_11 = Answer.create!(content: "5", question: question_3)
answer_12 = Answer.create!(content: "8", question: question_3)

question_4 = Question.create!(content: "4+4", deck: deck_1)
answer_13 = Answer.create!(content: "8", question: question_4, right_answer: true)
answer_14 = Answer.create!(content: "1", question: question_4)
answer_15 = Answer.create!(content: "5", question: question_4)
answer_16 = Answer.create!(content: "2", question: question_4)

question_5 = Question.create!(content: "5+5", deck: deck_1)
answer_17 = Answer.create!(content: "10", question: question_5, right_answer: true)
answer_18 = Answer.create!(content: "1", question: question_5)
answer_19 = Answer.create!(content: "5", question: question_5)
answer_20 = Answer.create!(content: "8", question: question_5)

deck_1 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_3 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_4 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_5 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_6 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_7 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_8 = Deck.create!(name: "array2", tips: "check lecture", level: 2)
deck_9 = Deck.create!(name: "array2", tips: "check lecture", level: 2)

question_6 = Question.create!(content: "1+1", deck: deck_2)
answer_21 = Answer.create!(content: "2", question: question_6, right_answer: true)
answer_22 = Answer.create!(content: "1", question: question_6)
answer_23 = Answer.create!(content: "5", question: question_6)
answer_24 = Answer.create!(content: "8", question: question_6)

question_7 = Question.create!(content: "2+2", deck: deck_2)
answer_25 = Answer.create!(content: "4", question: question_7, right_answer: true)
answer_26 = Answer.create!(content: "1", question: question_7)
answer_27 = Answer.create!(content: "5", question: question_7)
answer_28 = Answer.create!(content: "8", question: question_7)

question_8 = Question.create!(content: "3+3", deck: deck_2)
answer_29 = Answer.create!(content:  "6", question: question_8, right_answer: true)
answer_30 = Answer.create!(content: "1", question: question_8)
answer_31 = Answer.create!(content: "5", question: question_8)
answer_32 = Answer.create!(content: "8", question: question_8)

question_9 = Question.create!(content: "4+4", deck: deck_2)
answer_33 = Answer.create!(content: "8", question: question_9, right_answer: true)
answer_34 = Answer.create!(content: "1", question: question_9)
answer_35 = Answer.create!(content: "5", question: question_9)
answer_36 = Answer.create!(content: "2", question: question_9)

question_10 = Question.create!(content: "5+5", deck: deck_2)
answer_37 = Answer.create!(content: "10", question: question_10, right_answer: true)
answer_38 = Answer.create!(content: "1", question: question_10)
answer_39 = Answer.create!(content: "5", question: question_10)
answer_40 = Answer.create!(content: "8", question: question_10)

deck_1 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_2 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_4 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_5 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_6 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_7 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_8 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)
deck_9 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)



question_11 = Question.create!(content: "1+1", deck: deck_3)
answer_41 = Answer.create!(content: "2", question: question_11, right_answer: true)
answer_42 = Answer.create!(content: "1", question: question_11)
answer_43 = Answer.create!(content: "5", question: question_11)
answer_44 = Answer.create!(content: "8", question: question_11)

question_12 = Question.create!(content: "2+2", deck: deck_3)
answer_45 = Answer.create!(content: "4", question: question_12, right_answer: true)
answer_46 = Answer.create!(content: "1", question: question_12)
answer_47 = Answer.create!(content: "5", question: question_12)
answer_48 = Answer.create!(content: "8", question: question_12)

question_13 = Question.create!(content: "3+3", deck: deck_3)
answer_49 = Answer.create!(content:  "6", question: question_3, right_answer: true)
answer_50 = Answer.create!(content: "1", question: question_13)
answer_51 = Answer.create!(content: "5", question: question_13)
answer_52 = Answer.create!(content: "8", question: question_13)

question_14 = Question.create!(content: "4+4", deck: deck_3)
answer_53 = Answer.create!(content: "8", question: question_14, right_answer: true)
answer_54 = Answer.create!(content: "1", question: question_14)
answer_55 = Answer.create!(content: "5", question: question_14)
answer_56 = Answer.create!(content: "2", question: question_14)

question_15 = Question.create!(content: "5+5", deck: deck_3)
answer_57 = Answer.create!(content: "10", question: question_15, right_answer: true)
answer_58 = Answer.create!(content: "1", question: question_15)
answer_59 = Answer.create!(content: "5", question: question_15)
answer_60 = Answer.create!(content: "8", question: question_15)
