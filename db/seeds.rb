# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  u = User.create(email: Faker::Internet.email("user-#{n}"), password: Faker::Internet.password(10), username: Faker::Company.catch_phrase.titleize)
  q = Question.create(title: Faker::Company.catch_phrase, content: Faker::Lorem.sentences(Random.new.rand(1..10)).join(" "), user: u)

  Random.new.rand(1..3).times do |nn|
    Comment.create(commentable: q, user: User.all.sample, content: Faker::Lorem.sentences(Random.new.rand(1..2)).join(" "))
  end

  Random.new.rand(1..5).times do |nn|
    a = Answer.create(content: Faker::Lorem.sentences(Random.new.rand(1..10)).join(" "), user: u, question: q)

    Random.new.rand(1..3).times do |nnn|
      Comment.create(commentable: a, user: User.all.sample, content: Faker::Lorem.sentences(Random.new.rand(1..2)).join(" "))
    end
  end
end