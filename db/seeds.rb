# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(email:"bob@gmail.com", password:"Hestia2020")
user2 = User.create!(email:"kim@gmail.com", password:"Hestia2020")

profile1 = Profile.create!(user:user1, first_name:"Bob", nickname:"Bobby", description:"Le king du ménage", picture:"")
profile2 = Profile.create!(user:user2, first_name:"Kim", nickname:"Kimmy", description:"Ici pour la compèt", picture:"")

house1 = House.create!(name:"La maison du kiff", owner:user1)

habitant1 = Habitant.create!(house:house1, user:user1)
habitant2 = Habitant.create!(house:house1, user:user2)

Gift.create!(name:"Petit restau", description:"Un restau pour deux du choix du vaincqueur", house:house1, picture:"")

task1 = Task.create!(user:user1, house:house1, name:"Faire le lit", description:"Faire le lit au carré", points:3, status:false)
task2 = Task.create!(user:user2, house:house1, name:"Aspirateur", description:"Passer l'aspirateur dans toutes les pièces", points:6, status:false)
task3 = Task.create!(user:user1, house:house1, name:"Repassage", description:"Faire le repassage", points:7, status:false)
task4 = Task.create!(user:user2, house:house1, name:"Poubelles", description:"Sortir les poubelles", points:3, status:false)
task5 = Task.create!(user:user1, house:house1, name:"Vaisselle", description:"Faire la vaisselle", points:3, status:false)
task6 = Task.create!(user:user2, house:house1, name:"Litière", description:"Changer la litière du chat", points:4, status:false)

chatroom1 = Chatroom.create!(house:house1, name:"notre chatroom")

message1 = Message.create!(user:user1, chatroom:chatroom1, content:"c'est moi qui vais gagner!")
message2 = Message.create!(user:user2, chatroom:chatroom1, content:"non c'est moi!")
