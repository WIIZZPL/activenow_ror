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
  [grade: Grade.find_by(name: "2C"), subject: Subject.find_by(name: "Programming"),  teacher: User.find_by(email_address: "tomasz7@school.com")]
]

courses.each { |c| Course.create!(c) }

puts "Seeding exams... "
exams = [
  [title: "Arithmetic",         date: DateTime.new(2025, 11, 20), course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1A"))],
  [title: "Linear algebra",     date: DateTime.new(2026, 1, 10),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1A"))],

  [title: "Calculus",           date: DateTime.new(2026, 2, 10),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1A"))],

  [title: "Polish romanticism", date: DateTime.new(2025, 12, 5),  course: Course.find_by(subject: Subject.find_by(name: "Polish"),      grade: Grade.find_by(name: "1A"))],

  [title: "Pan Tadeusz",        date: DateTime.new(2026, 2, 8),   course: Course.find_by(subject: Subject.find_by(name: "Polish"),      grade: Grade.find_by(name: "1A"))],

  [title: "Arithmetic",         date: DateTime.new(2025, 11, 22), course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1B"))],
  [title: "Linear algebra",     date: DateTime.new(2026, 1, 12),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1B"))],
  
  [title: "Calculus",           date: DateTime.new(2026, 2, 12),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "1B"))],

  [title: "Polish romanticism", date: DateTime.new(2025, 12, 8),  course: Course.find_by(subject: Subject.find_by(name: "Polish"),      grade: Grade.find_by(name: "1B"))],

  [title: "Pan Tadeusz",        date: DateTime.new(2026, 2, 10),  course: Course.find_by(subject: Subject.find_by(name: "Polish"),      grade: Grade.find_by(name: "1B"))],

  [title: "Calculus",           date: DateTime.new(2025, 11, 20), course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "2C"))],
  [title: "Statistics",         date: DateTime.new(2025, 11, 22), course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "2C"))],
  [title: "Probability",        date: DateTime.new(2026, 1, 10),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "2C"))],

  [title: "Calculus II",        date: DateTime.new(2026, 2, 10),  course: Course.find_by(subject: Subject.find_by(name: "Math"),        grade: Grade.find_by(name: "2C"))],

  [title: "Algorithms",         date: DateTime.new(2026, 1, 14),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],
  [title: "C Programming",      date: DateTime.new(2026, 1, 10),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],
  [title: "Databases",          date: DateTime.new(2026, 1, 12),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],
  [title: "Ruby on rails",      date: DateTime.new(2026, 1, 11),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],

  [title: "Java Programming",   date: DateTime.new(2026, 2, 12),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],
  [title: "Data structures",    date: DateTime.new(2026, 2, 10),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))],
  [title: "Networking",         date: DateTime.new(2026, 2, 18),  course: Course.find_by(subject: Subject.find_by(name: "Programming"), grade: Grade.find_by(name: "2C"))]
]

exams.each { |e| Exam.create!(e) }

puts "Seeding marks... "
marks = [
  [student: User.find_by(email_address: "adrian1@school.com"), value: 4, desc: "", course: Exam.find_by(id: 1).course,  exam: Exam.find_by(id: 1)],
  [student: User.find_by(email_address: "adrian1@school.com"), value: 4, desc: "", course: Exam.find_by(id: 2).course,  exam: Exam.find_by(id: 2)],
  [student: User.find_by(email_address: "adrian1@school.com"), value: 2, desc: "", course: Exam.find_by(id: 4).course,  exam: Exam.find_by(id: 4)],

  [student: User.find_by(email_address: "bartek2@school.com"), value: 4, desc: "", course: Exam.find_by(id: 1).course,  exam: Exam.find_by(id: 1)],
  [student: User.find_by(email_address: "bartek2@school.com"), value: 4, desc: "", course: Exam.find_by(id: 2).course,  exam: Exam.find_by(id: 2)],
  [student: User.find_by(email_address: "bartek2@school.com"), value: 5, desc: "", course: Exam.find_by(id: 4).course,  exam: Exam.find_by(id: 4)],

  [student: User.find_by(email_address: "celina3@school.com"), value: 3, desc: "", course: Exam.find_by(id: 6).course,  exam: Exam.find_by(id: 6)],
  [student: User.find_by(email_address: "celina3@school.com"), value: 5, desc: "", course: Exam.find_by(id: 7).course,  exam: Exam.find_by(id: 7)],
  [student: User.find_by(email_address: "celina3@school.com"), value: 3, desc: "", course: Exam.find_by(id: 9).course,  exam: Exam.find_by(id: 9)],

  [student: User.find_by(email_address: "daniel4@school.com"), value: 2, desc: "", course: Exam.find_by(id: 6).course,  exam: Exam.find_by(id: 6)],
  [student: User.find_by(email_address: "daniel4@school.com"), value: 2, desc: "", course: Exam.find_by(id: 7).course,  exam: Exam.find_by(id: 7)],
  [student: User.find_by(email_address: "daniel4@school.com"), value: 4, desc: "", course: Exam.find_by(id: 9).course,  exam: Exam.find_by(id: 9)],

  [student: User.find_by(email_address: "emilia5@school.com"), value: 3, desc: "", course: Exam.find_by(id: 11).course, exam: Exam.find_by(id: 11)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 4, desc: "", course: Exam.find_by(id: 12).course, exam: Exam.find_by(id: 12)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 4, desc: "", course: Exam.find_by(id: 13).course, exam: Exam.find_by(id: 13)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 5, desc: "", course: Exam.find_by(id: 15).course, exam: Exam.find_by(id: 15)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 5, desc: "", course: Exam.find_by(id: 16).course, exam: Exam.find_by(id: 16)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 4, desc: "", course: Exam.find_by(id: 17).course, exam: Exam.find_by(id: 17)],
  [student: User.find_by(email_address: "emilia5@school.com"), value: 3, desc: "", course: Exam.find_by(id: 18).course, exam: Exam.find_by(id: 18)]
]

marks.each { |m| Mark.create!(m) }