# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
TrainingValue.destroy_all
Seance.destroy_all
TrainingMetric.destroy_all
TrainingExercice.destroy_all
Exercice.destroy_all
Metric.destroy_all
Training.destroy_all
UserSport.destroy_all
Sport.destroy_all
User.destroy_all

puts "Destroying users"


pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")


# NATATION :

# Création d'une instance Sport natation -> table sport
sport_natation = Sport.create!(name: "Natation")
sport_musculation = Sport.create!(name: "Musculation")

# Création d'une instance user_sport -> Table users_sports
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

metrics_crawl_natation = Metric.create!(
  duration: "",
  average_speed: "",
  repetition: "",
  serie: "",
  weight: "",
  breack_time: ""
)
exercice_crawl_natation = Exercice.create!(name: "Crawl", sport_id: sport_natation.id, metric_id: metrics_crawl_natation.id)

metrics_doscrawle_natation = Metric.create!(
  duration: "",
  average_speed: "",
  repetition: "",
  serie: "",
  weight: "",
  breack_time: ""
)
exercice_doscrawle_natation = Exercice.create!(name: "Dos crawlé", sport_id: sport_natation.id, metric_id: metrics_doscrawle_natation.id)

metrics_pullbouyl_natation = Metric.create!(
  duration: "",
  average_speed: "",
  repetition: "",
  serie: "",
  weight: "",
  breack_time: ""
)
exercice_pullbouy_natation = Exercice.create!(name: "Pull-bouy", sport_id: sport_natation.id, metric_id: metrics_pullbouyl_natation.id)

metrics_brasse_natation = Metric.create!(
  duration: "",
  average_speed: "",
  repetition: "",
  serie: "",
  weight: "",
  breack_time: ""
)
exercice_brasse_natation = Exercice.create!(name: "Brasse", sport_id: sport_natation.id, metric_id: metrics_brasse_natation.id)

training_endurance_natation_crawl = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_crawl_natation.id)
training_endurance_natation_doscrawle = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_doscrawle_natation.id)

training_sprint_natation_crawl = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_crawl_natation.id)
training_sprint_natation_doscrawle = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_doscrawle_natation.id)

training_metrics_endurance_crawl = TrainingMetric.create!(training_exercice_id: training_endurance_natation_crawl.id)
training_metrics_endurance_doscrawle = TrainingMetric.create!(training_exercice_id: training_endurance_natation_doscrawle.id)
training_metrics_sprint_crawl = TrainingMetric.create!(training_exercice_id: training_sprint_natation_crawl.id)
training_metrics_sprint_doscrawle = TrainingMetric.create!(training_exercice_id: training_sprint_natation_doscrawle.id)

seance_endurance_natation = Seance.create!(date:"", training_id: training_endurance_natation.id )
seance_sprint_natation = Seance.create!(date:"", training_id: training_sprint_natation.id )
seance_intervalle_natation = Seance.create!(date:"", training_id: training_intervalle_natation.id )


training_values_endurance_crawl = TrainingValue.create!(
  comment:"",
  rating: "",
  duration: "",
  date: "",
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance_natation.id
)

training_values_endurance_doscrawle = TrainingValue.create!(
  comment:"",
  rating: "",
  duration: "",
  date: "",
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance_natation.id
)

training_values_sprint_crawl = TrainingValue.create!(
  comment:"",
  rating: "",
  duration: "",
  date: "",
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint_natation.id
)

training_values_sprint_doscrawle = TrainingValue.create!(
  comment:"",
  rating: "",
  duration: "",
  date: "",
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint_natation.id
)
