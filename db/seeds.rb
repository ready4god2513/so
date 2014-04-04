# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  u = User.create(email: Faker::Internet.email("user-#{n}"), password: Faker::Internet.password(10))
  q = Question.create(title: Faker::Company.catch_phrase, content: Faker::Lorem.sentences(Random.new.rand(1..10)).join(" "), user: u)

  Random.new.rand(1..5).times do |nn|
    Answer.create(content: Faker::Lorem.sentences(Random.new.rand(1..10)).join(" "), user: u, question: q)
  end
end