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

deck_1 = Deck.create!(name: "strings1", tips: "check lecture", level: 1)

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

deck_2 = Deck.create!(name: "array2", tips: "check lecture", level: 2)

question_1 = Question.create!(content: "1+1", deck: deck_2)
answer_1 = Answer.create!(content: "2", question: question_1, right_answer: true)
answer_2 = Answer.create!(content: "1", question: question_1)
answer_3 = Answer.create!(content: "5", question: question_1)
answer_4 = Answer.create!(content: "8", question: question_1)

question_2 = Question.create!(content: "2+2", deck: deck_2)
answer_5 = Answer.create!(content: "4", question: question_2, right_answer: true)
answer_6 = Answer.create!(content: "1", question: question_2)
answer_7 = Answer.create!(content: "5", question: question_2)
answer_8 = Answer.create!(content: "8", question: question_2)

question_3 = Question.create!(content: "3+3", deck: deck_2)
answer_9 = Answer.create!(content:  "6", question: question_3, right_answer: true)
answer_10 = Answer.create!(content: "1", question: question_3)
answer_11 = Answer.create!(content: "5", question: question_3)
answer_12 = Answer.create!(content: "8", question: question_3)

question_4 = Question.create!(content: "4+4", deck: deck_2)
answer_13 = Answer.create!(content: "8", question: question_4, right_answer: true)
answer_14 = Answer.create!(content: "1", question: question_4)
answer_15 = Answer.create!(content: "5", question: question_4)
answer_16 = Answer.create!(content: "2", question: question_4)

question_5 = Question.create!(content: "5+5", deck: deck_2)
answer_17 = Answer.create!(content: "10", question: question_5, right_answer: true)
answer_18 = Answer.create!(content: "1", question: question_5)
answer_19 = Answer.create!(content: "5", question: question_5)
answer_20 = Answer.create!(content: "8", question: question_5)



deck_3 = Deck.create!(name: "boolean3", tips: "check lecture", level: 3)

question_1 = Question.create!(content: "1+1", deck: deck_3)
answer_1 = Answer.create!(content: "2", question: question_1, right_answer: true)
answer_2 = Answer.create!(content: "1", question: question_1)
answer_3 = Answer.create!(content: "5", question: question_1)
answer_4 = Answer.create!(content: "8", question: question_1)

question_2 = Question.create!(content: "2+2", deck: deck_3)
answer_5 = Answer.create!(content: "4", question: question_2, right_answer: true)
answer_6 = Answer.create!(content: "1", question: question_2)
answer_7 = Answer.create!(content: "5", question: question_2)
answer_8 = Answer.create!(content: "8", question: question_2)

question_3 = Question.create!(content: "3+3", deck: deck_3)
answer_9 = Answer.create!(content:  "6", question: question_3, right_answer: true)
answer_10 = Answer.create!(content: "1", question: question_3)
answer_11 = Answer.create!(content: "5", question: question_3)
answer_12 = Answer.create!(content: "8", question: question_3)

question_4 = Question.create!(content: "4+4", deck: deck_3)
answer_13 = Answer.create!(content: "8", question: question_4, right_answer: true)
answer_14 = Answer.create!(content: "1", question: question_4)
answer_15 = Answer.create!(content: "5", question: question_4)
answer_16 = Answer.create!(content: "2", question: question_4)

question_5 = Question.create!(content: "5+5", deck: deck_3)
answer_17 = Answer.create!(content: "10", question: question_5, right_answer: true)
answer_18 = Answer.create!(content: "1", question: question_5)
answer_19 = Answer.create!(content: "5", question: question_5)
answer_20 = Answer.create!(content: "8", question: question_5)
