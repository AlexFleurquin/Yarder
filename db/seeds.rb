puts "Deleting previous seed..."

Message.destroy_all
Chatroom.destroy_all
Participation.destroy_all
Task.destroy_all
Room.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating 9 users (1 client, 8 pros), 1 project, 2 rooms, 3 photos for each room, 4 tasks, 4 participations and 6 chatrooms..."


user1 = User.new(first_name: 'Boris', last_name: 'Paillard', email: 'boris@abc.com', password: 'azerty', phone_number: '0503050434')
user2 = User.new(first_name: 'Paul', last_name: 'Lahana', email: 'paul@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Maçon du coeur", bio: "Marre des étudiants qui me demandent de l'aide tout le temps, je relache ma tension en cassant des murs")
user3 = User.new(first_name: 'Martial', last_name: 'Salgues', email: 'martial@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Menuisier", bio: "Je travaille le bois depuis mes 6 ans")
user4 = User.new(first_name: 'Diane', last_name: 'Roussillon', email: 'diane@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Peintre", bio: "Je peins très bien (surtout après quelques verres de vin) et depuis longtemps")
user5 = User.new(first_name: 'Nadia', last_name: 'Auger', email: 'nadia@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Electricienne", bio:"Electricien depuis 20 ans et issu d'une lignée de plombier depuis 1830, je me tiens volontaire pour vous dépanner et pour disrupter le marché du BTP")
user6 = User.new(first_name: 'Cecile', last_name: 'Veneziani', email: 'cecile@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Architecte", bio:"Je design les meilleurs intérieurs - ou du moins les meilleurs sites web pour sur")
user7 = User.new(first_name: 'Romain', last_name: 'Sanson', email: 'romain@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Plombier", bio:"Je vous passe les best tuyaux ever")
user8 = User.new(first_name: 'Thibaud', last_name: 'Maurel', email: 'thibaud@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Etancheur", bio:"Après que je sois passé par là, plus rien ne fuit !")
user9 = User.new(first_name: 'Sunny', last_name: 'Ripert', email: 'sunny@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Maitre d'ouvrage", bio:"Je suis là depuis l'aube des temps, faites moi confiance avec vos projets")

user1.photo.attach(io: URI.open("https://media-exp1.licdn.com/dms/image/C4E03AQEfSGDe5SR0vQ/profile-displayphoto-shrink_400_400/0/1525092669872?e=1666828800&v=beta&t=TpAnM5Ewp40dPqYPVVOeANXZeuCrU-ls0jb4DilYn2c") , filename: "user1.png", content_type: "image/png")
user2.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/26028980?v=4"), filename: "user2.png", content_type: "image/png")
user3.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/10807969?v=4"), filename: "user3.png", content_type: "image/png")
user4.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/43373459?v=4"), filename: "user4.png", content_type: "image/png")
user5.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/54894352?v=4") , filename: "user5.png", content_type: "image/png")
user6.photo.attach(io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1538141857/pqtix54ml90iabvewwsv.jpg"), filename: "user6.png", content_type: "image/png")
user7.photo.attach(io: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1544604383/pnqv3gmdpbtqrstpqgls.jpg"), filename: "user7.png", content_type: "image/png")
user8.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/30435844?v=4"), filename: "user8.png", content_type: "image/png")
user9.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/132?v=4"), filename: "user9.png", content_type: "image/png")

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!
user6.save!
user7.save!
user8.save!
user9.save!

project1 = Project.new(user_id: user1.id, name: 'Appart Paris', address: "16 villa Gaudelet, 75011 Paris", building_type: "Immeuble", construction_year: "1969", urgency: "Pas de date fixée", budget: 16900, description: "Charmant immeuble avec grande capacité")
project1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "Project1.png", content_type: "image/png")
project1.save!

room1 = Room.new(name: "Ma cuisine", room_type: "Cuisine", project_id: project1.id)
room2 = Room.new(name: "Ma salle de bain", room_type: "Salle de bains ou toilettes", project_id: project1.id)
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-3bb406ef7e77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-46c336c7fd55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1550223026-0d6fd780c560?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://i.pinimg.com/736x/81/d9/1c/81d91c97119d5f2aa1d9ee436b807edb--kitchen-cabinet-layout-corner-kitchen-cabinets.jpg") , filename: "room1.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1604709177225-055f99402ea3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1153&q=80") , filename: "room2.png", content_type: "image/png")
room1.save!
room2.save!

task1 = Task.new(name: "Peindre la pièce", description: "Peindre le plafond et les murs en blanc", room_id: room1.id, status: "A faire", position: 1, start_date: "2022-10-01 00:00:00 UTC" , end_date: "2022-10-05 00:00:00 UTC", user_id: user4.id)
task2 = Task.new(name: "Maçonnerie", description: "Casser les murs non portants", room_id: room1.id, status: "En cours", position: 1, start_date: "2022-09-05 00:00:00 UTC" , end_date: "2022-09-15 00:00:00 UTC", user_id: user2.id)
task3 = Task.new(name: "Plomberie", description: "Refaire tuyaux de la cuisine", room_id: room1.id, status: "En cours", position: 2, start_date: "2022-09-05 00:00:00 UTC" , end_date: "2022-09-10 00:00:00 UTC", user_id: user7.id)
task4 = Task.new(name: "Electricité", description: "Mise en route compteur électrique", room_id: room1.id, status: "Faite", position: 1, start_date: "2022-09-10 00:00:00 UTC" , end_date: "2022-09-15 00:00:00 UTC", user_id: user5.id)

task1.save!
task2.save!
task3.save!
task4.save!

participation1 = Participation.create!(user_id: user4.id, project_id: project1.id)
participation2 = Participation.create!(user_id: user2.id, project_id: project1.id)
participation3 = Participation.create!(user_id: user7.id, project_id: project1.id)
participation4 = Participation.create!(user_id: user5.id, project_id: project1.id)

participation1.save!
participation2.save!
participation3.save!
participation4.save!

chatroom1 = Chatroom.new(client_id: user1.id, professional_id: user4.id, created_at: "2022-08-25 00:00:00 UTC", updated_at: "2022-08-28 00:00:00 UTC")
chatroom2 = Chatroom.new(client_id: user1.id, professional_id: user2.id, created_at: "2022-09-01 00:00:00 UTC", updated_at: "2022-09-07 00:00:00 UTC")
chatroom3 = Chatroom.new(client_id: user1.id, professional_id: user7.id, created_at: "2022-08-27 00:00:00 UTC", updated_at: "2022-08-31 00:00:00 UTC")
chatroom4 = Chatroom.new(client_id: user1.id, professional_id: user5.id, created_at: "2022-08-15 00:00:00 UTC", updated_at: "2022-08-23 00:00:00 UTC")
chatroom5 = Chatroom.new(client_id: user1.id, professional_id: user9.id, created_at: "2022-08-19 00:00:00 UTC", updated_at: "2022-08-22 00:00:00 UTC")
chatroom6 = Chatroom.new(client_id: user1.id, professional_id: user3.id, created_at: "2022-08-08 00:00:00 UTC", updated_at: "2022-08-10 00:00:00 UTC")

chatroom1.save!
chatroom2.save!
chatroom3.save!
chatroom4.save!
chatroom5.save!
chatroom6.save!

puts "Done!"
