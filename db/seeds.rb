# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Sport.destroy.all
# UserSport.destroy.all
# Training.destroy.all
Training.destroy_all
UserSport.destroy_all
Sport.destroy_all
User.destroy_all

puts "Destroying users"


pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")

sport_natation = Sport.create!(name: "Natation")
musculation_natation = Sport.create!(name: "Musculation")

pierre_sport = UserSport.create!(user_id: pierre.id, sport_id: sport_natation.id)

training_endurance_natation = Training.create!(
  name: "Endurance",
  description: "Ma séance d'endurance du lundi du soir pour pour gagner en cardio",
  user_sport_id: pierre_sport.id
)

training_sprint_natation = Training.create!(
  name: "Sprint",
  description: "Ma séance de srint du jundi du soir pour pour gagner en performance",
  user_sport_id: pierre_sport.id
)

training_intervalle_natation = Training.create!(
  name: "Intervalle",
  description: "Ma séance de natation par intervalle pour pour gagner en performance",
  user_sport_id: pierre_sport.id
)
