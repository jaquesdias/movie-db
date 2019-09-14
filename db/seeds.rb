15.times do
  user_pass = Faker::Internet.password
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: user_pass, password_confirmation: user_pass)
end

categories = [
  'Comedy',
  'Sci-fi',
  'Horror',
  'Romance',
  'Action',
  'Thriller',
  'Drama',
  'Mistery',
  'Crime',
  'Animation',
  'Adventure',
  'Fantasy',
  'Comedy-romance',
  'Action-comedy',
  'Superhero',
]

categories.each do |category|
  Category.find_or_initialize_by(name: category).save
end

15.times do
  movie = Movie.create(
    title: Faker::Book.title,
    description: Faker::Movie.quote,
    category_id: Category.order('RANDOM()').first.id,
    user_id: User.order('RANDOM()').first.id
  )
end

100.times do
  rating = Rating.find_or_initialize_by(
    user_id: User.order('RANDOM()').first.id,
    movie_id: Movie.order('RANDOM()').first.id
  )

  rating.rating_value = rand(0..5)
  rating.save
end
