# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "first : destroying"

Message.destroy_all if Rails.env.development?
Chatroom.destroy_all if Rails.env.development?
Profile.destroy_all if Rails.env.development?
Habitant.destroy_all if Rails.env.development?
House.destroy_all if Rails.env.development?
Gift.destroy_all if Rails.env.development?
Task.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

puts "destroyed ! "


puts "creating seeds..."
user1 = User.create!(email:"charlotte@gmail.com", password:"hestia")
user2 = User.create!(email:"pierre@gmail.com", password:"hestia")

profile1 = Profile.create!(user:user1, first_name:"Charlotte", nickname:"Chacha", description:"Ici pour la compet'", score: 0)
profile2 = Profile.create!(user:user2, first_name:"Pierre", nickname:"Pedro", description:"Le king du ménage", score: 0)

house1 = House.create!(name:"La maison du kiff", user:user1)

habitant1 = Habitant.create!(house:house1, user:user1)
habitant2 = Habitant.create!(house:house1, user:user2)

Gift.create!(name:"Petit restau", description:"Un restau pour deux du choix du vaincqueur", house:house1)

task1 = Task.create!(user:user1, house:house1, name:"Faire le lit", description:"Faire le lit au carré, pas juste ramener la couette pour faire genre", points:5, status:false)
task2 = Task.create!(user:user2, house:house1, name:"Passer l'aspi", description:"Passer l'aspirateur dans toutes les pièces", points:15, status:false)
task3 = Task.create!(user:user1, house:house1, name:"Faire le repassage", description:"Faire le repassage", points:30, status:false)
task4 = Task.create!(user:user2, house:house1, name:"Sortir les poubelles", description:"Sortir les poubelles (avant qu'elles puent)", points:10, status:false)
task5 = Task.create!(user:user1, house:house1, name:"Faire la vaisselle", description:"Faire la vaisselle", points:20, status:false)
task6 = Task.create!(user:user2, house:house1, name:"Changer la litière", description:"Changer la litière de Moustache", points:10, status:false)

# chatroom1 = Chatroom.create!(house:house1, name:"notre chatroom")

# message1 = Message.create!(user:user1, chatroom:chatroom1, content:"c'est moi qui vais gagner!")
# message2 = Message.create!(user:user2, chatroom:chatroom1, content:"non c'est moi!")

file = URI.open("https://res.cloudinary.com/drnblm552/image/upload/v1607016682/2ci4ixe3mubbl37plpzl5j8841qq.jpg")
profile2.picture.attach(io: file, filename: "homme.jpg", content_type: 'image/jpg')

file2 = URI.open("https://res.cloudinary.com/drnblm552/image/upload/v1607075911/whk30xsl017uzaww2p9ea12hln3o.jpg")
profile1.picture.attach(io: file2, filename: "femme.jpg", content_type: 'image/jpg')


puts "seeds created !"
