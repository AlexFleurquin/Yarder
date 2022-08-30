puts "Deleting previous seed..."

Participation.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating 2 users, 1 project, 2 rooms, 3 photos for each room and 1 participation..."


user1 = User.new(first_name: 'Romain', last_name: 'Paillard', email: 'romain@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true)
user2 = User.new(first_name: 'Boris', last_name: 'Paillard', email: 'boris@abc.com', password: 'azerty', phone_number: '0503050434')
user1.photo.attach(io: URI.open("https://media-exp1.licdn.com/dms/image/C5603AQEXicEGcgYBOQ/profile-displayphoto-shrink_800_800/0/1517764268318?e=1666828800&v=beta&t=MAxLCV9i595HRSpuXCyYUtbv2ngZQofLUwppNVfkdvM") , filename: "user1.png", content_type: "image/png")
user2.photo.attach(io: URI.open("https://media-exp1.licdn.com/dms/image/C4E03AQEfSGDe5SR0vQ/profile-displayphoto-shrink_400_400/0/1525092669872?e=1666828800&v=beta&t=TpAnM5Ewp40dPqYPVVOeANXZeuCrU-ls0jb4DilYn2c") , filename: "user2.png", content_type: "image/png")
user1.save!
user2.save!

project1 = Project.new(user_id: user2.id, name: 'Mon premier Projet', address: "16 villa Gaudelet, 75011 Paris", building_type: "Immeuble", construction_year: "1969", urgency: "Moins de 6 mois", budget: 6900, description: "Charmant immeuble avec grande capacité")
project1.photo.attach(io: URI.open("https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "Project1.png", content_type: "image/png")
project1.save!

room1 = Room.new(room_type: "Cuisine", project_id: project1.id)
room2 = Room.new(room_type: "Salle de Bain", project_id: project1.id)
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-3bb406ef7e77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1556912173-46c336c7fd55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80") , filename: "room1.png", content_type: "image/png")
room1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1550223026-0d6fd780c560?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room1.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1604709177225-055f99402ea3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80") , filename: "room2.png", content_type: "image/png")
room2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1564540583246-934409427776?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1153&q=80") , filename: "room2.png", content_type: "image/png")
room1.save!
room2.save!

participation1 = Participation.create!(user_id: user1.id, project_id: project1.id)

puts "Done!"
