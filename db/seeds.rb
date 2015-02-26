# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = []
5.times do
  users << User.create(name: Faker::Name.name, email: Faker::Internet.email,
                       password: "password", bio: Faker::Lorem.paragraph,
                       avatar_url: Faker::Avatar.image)
end

questions = []
10.times do
  questions << Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph,
                               user: users.sample)
end

answers = []
questions.each do |question|
  answers << Answer.create(content: Faker::Hacker.say_something_smart, question: question,
                           user: users.sample)
  answers << Answer.create(content: Faker::Hacker.say_something_smart, question: question,
                           user: users.sample)
end
