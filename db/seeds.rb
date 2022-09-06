puts "Deleting previous seed..."

Message.destroy_all
Chatroom.destroy_all
Participation.destroy_all
Task.destroy_all
Room.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating 5 users, 1 project, 2 rooms, 2 tasks, 3 photos for each room and 2 participations..."


user1 = User.new(first_name: 'Romain', last_name: 'Paillard', email: 'romain@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, specialty: "Electricien", bio:"Electricien depuis 20 ans et issu d'une lignée de plombier depuis 1830, je me tiens volontaire pour vous dépanner et pour disrupter le marché du BTP")
user2 = User.new(first_name: 'Boris', last_name: 'Paillard', email: 'boris@abc.com', password: 'azerty', phone_number: '0503050434')
user3 = User.new(first_name: 'Paul', last_name: 'Portier', email: 'paul@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, specialty: "Menuisier", bio: "Je travaille le bois depuis mes 6 ans")
user4 = User.new(first_name: 'Diane', last_name: 'Roussillon', email: 'diane@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Peintre", bio: "Je peins très bien et depuis longtemps")
user5 = User.new(first_name: 'Paul', last_name: 'Lahana', email: 'paull@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true, speciality: "Plombier", bio: "Marre des étudiants qui me demandent de l'aide tout le temps je préfère me réorienter dans les tuyaux")

user1.photo.attach(io: URI.open("https://media-exp1.licdn.com/dms/image/C5603AQEXicEGcgYBOQ/profile-displayphoto-shrink_800_800/0/1517764268318?e=1666828800&v=beta&t=MAxLCV9i595HRSpuXCyYUtbv2ngZQofLUwppNVfkdvM") , filename: "user1.png", content_type: "image/png")
user2.photo.attach(io: URI.open("https://media-exp1.licdn.com/dms/image/C4E03AQEfSGDe5SR0vQ/profile-displayphoto-shrink_400_400/0/1525092669872?e=1666828800&v=beta&t=TpAnM5Ewp40dPqYPVVOeANXZeuCrU-ls0jb4DilYn2c") , filename: "user2.png", content_type: "image/png")
user3.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/54004476?v=4"), filename: "user3.png", content_type: "image/png")
user4.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/43373459?v=4"), filename: "user4.png", content_type: "image/png")
user5.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/26028980?v=4"), filename: "user5.png", content_type: "image/png")
user1.save!
user2.save!
user3.save!
user4.save!
user5.save!

project1 = Project.new(user_id: user2.id, name: 'Mon premier Projet', address: "16 villa Gaudelet, 75011 Paris", building_type: "Immeuble", construction_year: "1969", urgency: "Pas de date fixée", budget: 6900, description: "Charmant immeuble avec grande capacité")
project1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "Project1.png", content_type: "image/png")
project1.save!

room1 = Room.new(name: "Ma cuisine", room_type: "Cuisine", project_id: project1.id)
room2 = Room.new(name: "Ma salle de bain", room_type: "Salle de bains ou toilettes", project_id: project1.id)
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-3bb406ef7e77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-46c336c7fd55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1550223026-0d6fd780c560?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1604709177225-055f99402ea3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1153&q=80") , filename: "room2.png", content_type: "image/png")
room1.save!
room2.save!

task1 = Task.new(name: "Peindre le plafond", description: "Peindre le plafond de la pièce en blanc", room_id: room1.id, status: "A faire", position: 1, start_date: "2022-09-01 00:00:00 UTC" , end_date: "2022-09-20 00:00:00 UTC", user_id: 3)
task2 = Task.new(name: "Mise en route compteur", description: "Mise en route compteur électrique", room_id: room1.id, status: "A faire", position: 2, start_date: "2022-09-10 00:00:00 UTC" , end_date: "2022-09-15 00:00:00 UTC", user_id: 4)
task1.save!
task2.save!

participation1 = Participation.create!(user_id: user1.id, project_id: project1.id)
participation1.save!
participation2 = Participation.create!(user_id: user3.id, project_id: project1.id)
participation2.save!

puts "Done!"
