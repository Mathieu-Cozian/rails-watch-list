# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
movies = user["results"]
puts "Creating movies..."

movies.each do |movi|
  movie = Movie.create!(title: movi["title"], overview: movi["overview"], rating: movi["vote_average"])
  puts "Created #{movie.title}"
end

List.destroy_all
puts "creating lists"
List.create!(name: "Drama")
List.create!(name: "Horror")
List.create!(name: "Adventure")
List.create!(name: "Favourites")
List.create!(name: "Comédies")

puts "Finished!"
