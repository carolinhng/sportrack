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
Metric.destroy_all
Exercice.destroy_all
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

# Création d'instances Exercice -> Table exercices

exercice_crawl_natation = Exercice.create!(name: "Crawl", sport_id: sport_natation.id)
exercice_doscrawle_natation = Exercice.create!(name: "Dos crawlé", sport_id: sport_natation.id)
exercice_pullbouy_natation = Exercice.create!(name: "Pull-bouy", sport_id: sport_natation.id)
exercice_brasse_natation = Exercice.create!(name: "Brasse", sport_id: sport_natation.id)


# Création d'instances Metric -> Table metrics

sport_natation.exercices.each do |exercice|
  metrics_duree = Metric.create!(
    metric: "Durée",
    unit: "minutes",
    exercice_id: exercice.id
  )

  metrics_distance = Metric.create!(
    metric: "Distance",
    unit: "mètres",
    exercice_id: exercice.id
  )

  metrics_vitesse = Metric.create!(
    metric: "Vitesse",
    unit: "km/h",
    exercice_id: exercice.id
  )

  metrics_temps_de_repos = Metric.create!(
    metric: "Temps de repos",
    unit: "minutes",
    exercice_id: exercice.id
  )

  metrics_serie = Metric.create!(
    metric: "Série",
    unit: "nombre",
    exercice_id: exercice.id
  )
end


# Création d'instances TrainingExercice -> Table trainings_exercices

training_endurance_natation_crawl = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_crawl_natation.id)
training_endurance_natation_doscrawle = TrainingExercice.create!(training_id: training_endurance_natation.id, exercice_id: exercice_doscrawle_natation.id)

training_sprint_natation_crawl = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_crawl_natation.id)
training_sprint_natation_doscrawle = TrainingExercice.create!(training_id: training_sprint_natation.id, exercice_id: exercice_doscrawle_natation.id)

# Création d'instances TrainingMetric -> Table trainings_metrics

training_metrics_endurance_crawl = TrainingMetric.create!(
  training_exercice_id: training_endurance_natation_crawl.id,
  metric: "Vitesse",
  unit: "km/h"
)

training_metrics_endurance_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_endurance_natation_doscrawle.id,
  metric: "Vitesse",
  unit: "km/h"
)

training_metrics_sprint_crawl = TrainingMetric.create!(
  training_exercice_id: training_sprint_natation_crawl.id,
  metric: "Vitesse",
  unit: "km/h"
)

training_metrics_sprint_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_sprint_natation_doscrawle.id,
  metric: "Vitesse",
  unit: "km/h"
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
  seance_id: seance_endurance_natation.id,
  value: "20"
)

training_values_endurance_crawl_two = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance_natation.id,
  value: "18"
)

training_values_endurance_doscrawle_one = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance_natation.id,
  value: "14"
)

training_values_endurance_doscrawle_two = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance_natation.id,
  value: "12"
)

training_values_sprint_crawl_one = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint_natation.id,
  value: "8"
)

training_values_sprint_crawl_two = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint_natation.id,
  value: "14"
)

training_values_sprint_doscrawle_one = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint_natation.id,
  value: "200"
)

training_values_sprint_doscrawle_two = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint_natation.id,
  value: "6"
)
