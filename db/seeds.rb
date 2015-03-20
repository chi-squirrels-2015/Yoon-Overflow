# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = []
50.times do
  users << User.create(name: Faker::Name.name, email: Faker::Internet.email,
                       password: "password", bio: Faker::Lorem.paragraph,
                       avatar_url: Faker::Avatar.image)
end

questions = []
100.times do
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

comments = []
30.times do
  comments << Comment.create(content: Faker::Hacker.say_something_smart, commentable_id: (1..10).to_a.sample, commentable_type: ["Question", "Answer"].sample, author: users.sample)
end


100.times do
  Vote.create(votable_id: Question.all.pluck(:id).sample, voter_id: User.all.pluck(:id).sample, votable_type: "Question")
end

100.times do
  Vote.create(votable_id: Answer.all.pluck(:id).sample, voter_id: User.all.pluck(:id).sample, votable_type: "Answer")
end
