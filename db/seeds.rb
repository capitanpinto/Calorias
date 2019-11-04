# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "No Negativo",
             email: "no@no.no",
             password:              "nonono",
             password_confirmation: "nonono")

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

now = Time.now
month_ago = now - 60 * 60 * 24 * 120
users = User.order(:created_at).take(6)
a=[0,1,2,3,4,5]

240.times do
  a.shuffle!
  content = Faker::Lorem.sentence(word_count: 5)
  nc=a[1]
  qc=a[2]
  rand_time = rand(month_ago..now)
  users.each { |user| user.calos.create!(coment: content, 
                                              created_at: rand_time,
                                              ncal: nc, qcal: qc) }
end