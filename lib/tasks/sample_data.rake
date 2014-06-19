namespace :db do
  desc "Fill database with Hardcoded Users"
  task populate: :environment do
        

  User.create!(email: 'employer@test.ca', username: 'employer', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Mr.', lname: 'Money', employer: true)
  User.create!(email: 'employer1@test.ca', username: 'employer1', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Cpt.', lname: 'Cash', employer: true)
  User.create!(email: 'employee@test.ca', username: 'employee', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Jane', lname: 'Doe')
  User.create!(email: 'employee1@test.ca', username: 'employee1', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'John', lname: 'Smith')
  User.create!(email: 'employee2@test.ca', username: 'employee2', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Eric', lname: 'Einstein')
  User.create!(email: 'employee3@test.ca', username: 'employee3', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Hank', lname: 'Henshaw')
  User.create!(email: 'employee4@test.ca', username: 'employee4', 
    password: 'testtest', password_confirmation: 'testtest', 
    fname: 'Aaron', lname: 'Adams')
  Skilllabel.create!(label: "Java")
  Skilllabel.create!(label: "Ruby")
  Skilllabel.create!(label: "Educational development")
  Skilllabel.create!(label: "Typing")
  Skill.create!(label: "Java", user_id: 9)
  Skill.create!(label: "Ruby", user_id: 9)
  Skill.create!(label: "Educational development", user_id: 9)
  Skill.create!(label: "Typing", user_id: 9)
  Posting.create!(title: "Working with ruby", description: "Come wokr for us and make Ruby things!", user_id: 2)
  Posting.create!(title: "Working with Java", description: "Come wokr for us and make Java things!", user_id: 2)
  Posting.create!(title: "Working with Typing and Educational Development", 
  	description: "Come wokr for us and make typing and education things!", user_id: 2)
  Skill.create!(label: "Java", user_id: 1, posting_id: 1, mandatory: true)
  Skill.create!(label: "Ruby", user_id: 1, posting_id: 2, mandatory: false)
  Skill.create!(label: "Educational development", user_id: 1, posting_id: 3, mandatory: true)
  Skill.create!(label: "Typing", user_id: 1, posting_id: 3, mandatory: true)
  Friendship.create!(friendship_id: 1, sender_id: 2, receiver_id: 1, sent_at: "2014-02-21 02:31:24", accepted: true)



  #Data for Raffi

  #user id 8
  User.create!(email: 'peterwest@uft.ca', username: 'peterwest', 
    password: 'peterpeter', password_confirmation: 'peterpeter', 
    fname: 'Peter', lname: 'West')

  #user id 9
  User.create!(email: 'henrynorth@uvic.ca', username: 'henrynorth', 
    password: 'henryhenry', password_confirmation: 'henryhenry', 
    fname: 'Henry', lname: 'North')

  #user id 10
  User.create!(email: 'marrybond.@ubc.ca', username: 'marrybond', 
    password: 'marrymarry', password_confirmation: 'marrymarry', 
    fname: 'Marry', lname: 'Bond')

  #user id 11
  User.create!(email: 'jamesblack@gmail.ca', username: 'jamesblack', 
    password: 'jamesjames', password_confirmation: 'jamesjames', 
    fname: 'James', lname: 'Black')

  Friendship.create!(friendship_id: 8, sender_id: 9, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 9, sender_id: 10, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 10, sender_id: 11, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 11, sender_id: 11, receiver_id: 10, sent_at: "2014-02-21 02:31:24", accepted: true)
  end
end
