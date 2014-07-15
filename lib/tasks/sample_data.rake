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



  #Data for Raffi

  #user id 8
  User.create!(email: 'peterwest@uft.ca', username: 'peterwest', 
    password: 'peterpeter', password_confirmation: 'peterpeter', 
    fname: 'Peter', lname: 'West', info: "I am a high school student with interests in designing websites. I am very eager to work and quick learner.  I have moderate experience with many aspects of web design such as HTML, CSS and Javascript.")
  Surveyprofile.create!(id: 1, user_id: 8, survey_id: 1, postalcode: "V1X 2G4", education: "Grade 10", 
    city: "Kelowna", province: "British Columbia", gender: "Male", birthday: "2014-06-12 00:00:00")
  Experience.create!(experience_id: 1, user_id: 8, sdate: "2014-06-12 00:00:00", fdate: "2014-06-18 00:00:00", 
    company_name: "NASA", title: "Head Honcho", supervisor: "Barrack Obama", description: "In charge of sending off rockets and creating new ways to live in space")
  Experience.create!(experience_id: 2, user_id: 8, sdate: "2013-01-12 00:00:00", fdate: "2013-06-12 00:00:00", 
    company_name: "McDonalds", title: "Chef", supervisor: "Ronald McDonald", description: "Made burgers and lunch and was in charge of dishes the rest of the time")
  Reference.create!(reference_id:1, user_id: 8, fname: "Matthew", lname: "Bojey", relationship: "Role Model", 
    phone_number: "123-456-7890", email: "matt@test.ca")
  Reference.create!(reference_id:2, user_id: 8, fname: "Raffi", lname: "Kudlac", relationship: "Bad guy", 
    phone_number: "123-456-7809", email: "raffi@test.ca")

  Skill.create!(label: "programming", user_id: 8, times_endorsed: 3)
  Skill.create!(label: "web design", user_id: 8, times_endorsed: 2)
  Skill.create!(label: "gaming", user_id: 8, times_endorsed: 1)


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
  
  #user id 12
  User.create!(email: 'jamesblack2@gmail.ca', username: 'jamesblack2', 
    password: 'jamesjames', password_confirmation: 'jamesjames', 
    fname: 'John', lname: 'Black')
  
  #user id 13
  User.create!(email: 'jamesblack3@gmail.ca', username: 'jamesblack3', 
    password: 'jamesjames', password_confirmation: 'jamesjames', 
    fname: 'Jack', lname: 'Black')
  
  #user id 14
  User.create!(email: 'jamesblack4@gmail.ca', username: 'jamesblack4', 
    password: 'jamesjames', password_confirmation: 'jamesjames', 
    fname: 'Jimmy', lname: 'Black')

  #user id 15
  User.create!(email: 'adambond@gmail.ca', username: 'Adambond', 
    password: 'adamadam', password_confirmation: 'adamadam', 
    fname: 'Adam', lname: 'Bond', employer: true)


  Endorse.create!(skill_id: 9, endorser_id: 9)
  Endorse.create!(skill_id: 9, endorser_id: 10)
  Endorse.create!(skill_id: 9, endorser_id: 11)
  Endorse.create!(skill_id: 10, endorser_id: 12)
  Endorse.create!(skill_id: 10, endorser_id: 13)
  Endorse.create!(skill_id: 11, endorser_id: 14)

  Friendship.create!(friendship_id: 8, user_id: 9, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 9, user_id: 10, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 10, user_id: 11, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 11, user_id: 11, receiver_id: 10, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 12, user_id: 12, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 13, user_id: 12, receiver_id: 9, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 14, user_id: 13, receiver_id: 8, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 15, user_id: 13, receiver_id: 10, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 16, user_id: 14, receiver_id: 12, sent_at: "2014-02-21 02:31:24", accepted: true)
  #Followers of Company Mr. Money
  Friendship.create!(friendship_id: 17, user_id: 13, receiver_id: 1, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 18, user_id: 12, receiver_id: 1, sent_at: "2014-02-21 02:31:24", accepted: true)
  Friendship.create!(friendship_id: 19, user_id: 14, receiver_id: 1, sent_at: "2014-02-21 02:31:24", accepted: true)

  end
end
