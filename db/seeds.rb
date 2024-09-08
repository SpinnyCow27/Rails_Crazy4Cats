# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'test@example.com', password: 'password', name: 'Marcelo', photo: 'some_url')

10.times do
  user = User.create(email: Faker::Internet.email, password: 'password', name: Faker::Name.name)
  post = user.posts.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)

  5.times do
    post.comments.create(content: Faker::Lorem.sentence, user: user)
    post.reactions.create(kind: ['like', 'dislike'].sample, user: user)
  end
end
