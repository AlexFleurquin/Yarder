Participation.destroy_all
Project.destroy_all
User.destroy_all


user1 = User.create!(first_name: 'Romain', last_name: 'Paillard', email: 'romain@abc.com', password: 'azerty', phone_number: '0503050434', is_pro: true)
user2 = User.create!(first_name: 'Boris', last_name: 'Paillard', email: 'boris@abc.com', password: 'azerty', phone_number: '0503050434')
project1 = Project.create!(user_id: user2.id, name: 'Test')
participation1 = Participation.create!(user_id: user1.id, project_id: project1.id)
