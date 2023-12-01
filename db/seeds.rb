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

puts "Destroying / create database"


pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")


# NATATION :

# Création d'une instance Sport natation -> table sport
sport_natation = Sport.create!(name: "Natation")
sport_musculation = Sport.create!(name: "Musculation")
sport_cyclisme = Sport.create!(name: "Cyclisme")
sport_yoga = Sport.create!(name: "Yoga")

# Création d'une instance UserSport -> Table users_sports
pierre_sport = UserSport.create!(user_id: pierre.id, sport_id: sport_natation.id)

# Création d'instances Training -> Table trainings
training_endurance_natation = Training.create!(
  name: "Endurance",
  description: "Ma séance d'endurance du lundi du soir pour gagner en cardio",
  user_sport_id: pierre_sport.id
)

training_sprint_natation = Training.create!(
  name: "Sprint",
  description: "Ma séance de sprint du jeudi du soir pour gagner en performance",
  user_sport_id: pierre_sport.id
)

training_intervalle_natation = Training.create!(
  name: "Intervalle",
  description: "Ma séance de natation par intervalle pour gagner en performance",
  user_sport_id: pierre_sport.id
)

# Création d'instances Metric & Exercice -> Table metrics & exercices

metrics_crawl_natation = Metric.create!(
  duration: 30,
  average_speed: 8,
  repetition: "",
  serie: 2,
  weight: "",
  breack_time: Time.parse("01:30")
)
exercice_crawl_natation = Exercice.create!(name: "Crawl", sport_id: sport_natation.id, metric_id: metrics_crawl_natation.id)

metrics_doscrawle_natation = Metric.create!(
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:00")
)
exercice_doscrawle_natation = Exercice.create!(name: "Dos crawlé", sport_id: sport_natation.id, metric_id: metrics_doscrawle_natation.id)

metrics_pullbouy_natation = Metric.create!(
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("02:00")
)
exercice_pullbouy_natation = Exercice.create!(name: "Pull-bouy", sport_id: sport_natation.id, metric_id: metrics_pullbouy_natation.id)

metrics_brasse_natation = Metric.create!(
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:00")
)
exercice_brasse_natation = Exercice.create!(name: "Brasse", sport_id: sport_natation.id, metric_id: metrics_brasse_natation.id)

# Création d'instances TrainingExercice -> Table trainings_exercices

training_endurance_natation_crawl = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_crawl_natation.id)
training_endurance_natation_doscrawle = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_doscrawle_natation.id)

training_sprint_natation_crawl = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_crawl_natation.id)
training_sprint_natation_doscrawle = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_doscrawle_natation.id)

# Création d'instances TrainingMetric -> Table trainings_metrics

training_metrics_endurance_crawl = TrainingMetric.create!(
  training_exercice_id: training_endurance_natation_crawl.id,
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:30")
)

training_metrics_endurance_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_endurance_natation_doscrawle.id,
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:00")
)

training_metrics_sprint_crawl = TrainingMetric.create!(
  training_exercice_id: training_sprint_natation_crawl.id,
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:00")
)

training_metrics_sprint_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_sprint_natation_doscrawle.id,
  duration: 0,
  average_speed: 0,
  repetition: "",
  serie: 0,
  weight: "",
  breack_time: Time.parse("01:00")
)

# Création d'instances Seance -> Table seances
seance_endurance_natation = Seance.create!(
  training_id: training_endurance_natation.id,
  comment: "Cette séance était top ! J'ai rempli tous mes objectifs",
  rating: 5,
  duration: 45,
  date: Date.today
)

seance_sprint_natation = Seance.create!(
  training_id: training_sprint_natation.id,
  comment: "Bof, j'ai mal dormi la veille, j'ai pu aller jusqu'au bout ",
  rating: 2,
  duration: 30,
  date: Date.today
)

seance_intervalle_natation = Seance.create!(
  training_id: training_intervalle_natation.id,
  comment: "J'ai bien travaillé mon cardio, cet entrainement est vraiment top",
  rating: 5,
  duration: 35,
  date: Date.today
)

# Création d'instances TrainingVelue -> Table trainings_values

training_values_endurance_crawl = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance_natation.id
)

training_values_endurance_doscrawle = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance_natation.id
)

training_values_sprint_crawl = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint_natation.id
)

training_values_sprint_doscrawle = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint_natation.id
)
