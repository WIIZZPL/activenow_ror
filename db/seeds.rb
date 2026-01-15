# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding grades... "
grades = [
  [name: "1A", year: 1],
  [name: "1B", year: 1],
  [name: "2C", year: 2],
]

grades.each { |g| Grade.create!(g) }

puts "Seeding user types..."
user_types = %w[student teacher admin]
user_types.each { |ut| UserType.find_or_create_by!(name: ut)}

puts "Seeding users..."
users = [
  [email_address: "adrian1@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student'), grade: Grade.find_by(name: "1A")],
  [email_address: "bartek2@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student'), grade: Grade.find_by(name: "1A")],
  [email_address: "celina3@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student'), grade: Grade.find_by(name: "1B")],
  [email_address: "daniel4@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student'), grade: Grade.find_by(name: "1B")],
  [email_address: "emilia5@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student'), grade: Grade.find_by(name: "2C")],
  
  [email_address: "sandra6@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'teacher')],
  [email_address: "tomasz7@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'teacher')],
  
  [email_address: "marcin8@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'admin')]
]

users.each { |u| User.create!(u) }

puts "Seeding subjects... "
subjects = [
  [name: "Math"],
  [name: "Polish"],
  [name: "Programming"]
]

subjects.each { |s| Subject.create!(s) }

puts "Seeding courses... "
courses = [
  [grade: Grade.find_by(name: "1A"), subject: Subject.find_by(name: "Math"),         teacher: User.find_by(email_address: "sandra6@school.com")],
  [grade: Grade.find_by(name: "1A"), subject: Subject.find_by(name: "Polish"),       teacher: User.find_by(email_address: "tomasz7@school.com")],
  
  [grade: Grade.find_by(name: "1B"), subject: Subject.find_by(name: "Math"),         teacher: User.find_by(email_address: "sandra6@school.com")],
  [grade: Grade.find_by(name: "1B"), subject: Subject.find_by(name: "Polish"),       teacher: User.find_by(email_address: "tomasz7@school.com")],
  
  [grade: Grade.find_by(name: "2C"), subject: Subject.find_by(name: "Math"),         teacher: User.find_by(email_address: "sandra6@school.com")],
  [grade: Grade.find_by(name: "2C"), subject: Subject.find_by(name: "Programming"),  teacher: User.find_by(email_address: "tomasz7@school.com")],
]

courses.each { |c| Course.create!(c) }