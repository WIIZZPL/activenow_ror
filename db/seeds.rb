# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding user types..."
user_types = %w[student teacher admin]
user_types.each { |ut| UserType.find_or_create_by!(name: ut)}

puts "Seeding users..."
users = [
  [email_address: "adrian1@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student')],
  [email_address: "bartek2@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student')],
  [email_address: "celina3@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student')],
  [email_address: "daniel4@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student')],
  [email_address: "emilia5@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'student')],
  
  [email_address: "sandra6@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'teacher')],
  [email_address: "tomasz7@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'teacher')],
  
  [email_address: "marcin8@school.com", password: "1234", password_confirmation: "1234", user_type: UserType.find_by(name: 'admin')]
]

users.each { |u| User.create!(u) }