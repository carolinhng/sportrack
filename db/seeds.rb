Seance.destroy_all
TrainingValue.destroy_all
TrainingMetric.destroy_all
Metric.destroy_all
TrainingExercice.destroy_all
Exercice.destroy_all
Training.destroy_all
UserSport.destroy_all
Sport.destroy_all
User.destroy_all

puts "Seed success"

#  Création d'une instance User -> users -------------------------------------------------------------------------------

pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")



#  List des sports -----------------------------------------------------------------------------------------------------

natation = Sport.create!(name: "Natation")
musculation = Sport.create!(name: "Musculation")
cyclisme = Sport.create!(name: "Cyclisme")
yoga = Sport.create!(name: "Yoga")



#  Création d'1 user_sport de Natation appartenant à Pierre -> Table users_sports --------------------------------------

pierre_sport = UserSport.create!(user_id: pierre.id, sport_id: natation.id)



# Création des 4 Exercices de Natation -> Table exercices --------------------------------------------------------------

exercie_crawl = Exercice.create!(name: "Crawl", sport_id: natation.id)
exerice_doscrawle = Exercice.create!(name: "Dos crawlé", sport_id: natation.id)
exercice_pullbouy = Exercice.create!(name: "Pull-bouy", sport_id: natation.id)
exercice_brasse = Exercice.create!(name: "Brasse", sport_id: natation.id)



# Création des Metric liés à un exercices -> Table metrics -------------------------------------------------------------

natation.exercices.each do |exercice|
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


# Création de 2 entrainements liés à usersport / instances Training -> Table trainings ---------------------------------

training_endurance = Training.create!(
  name: "Endurance",
  description: "Ma séance d'endurance du lundi du soir pour gagner en cardio",
  user_sport_id: pierre_sport.id
)

training_sprint = Training.create!(
  name: "Sprint",
  description: "Ma séance de sprint du jeudi du soir pour gagner en performance",
  user_sport_id: pierre_sport.id
)



# Création des TrainingExercice pour chaque exo d'un entrainement -> Table trainings_exercices -------------------------
# Entrainement endurance avec 2 exos
training_exercice_endurance_crawl = TrainingExercice.create!(training_id: training_endurance.id, exercice_id: exercie_crawl.id)
training_exercice_endurance_doscrawle = TrainingExercice.create!(training_id: training_endurance.id, exercice_id: exerice_doscrawle.id)
# Entrainement sprint avec 2 exos
training_exercice_sprint_crawl = TrainingExercice.create!(training_id: training_sprint.id, exercice_id: exercie_crawl.id)
training_exercice_sprint_doscrawle = TrainingExercice.create!(training_id: training_sprint.id, exercice_id: exerice_doscrawle.id)



# Création des TrainingMetrics lié à 1 TrainingExercice -> Table trainings_metrics -------------------------------------

# Entrainement endurance
training_metrics_endurance_crawl = TrainingMetric.create!(
  training_exercice_id: training_exercice_endurance_crawl.id,
  metric: "Température",
  unit: "C°"
)

training_metrics_endurance_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_exercice_endurance_doscrawle.id,
  metric: "Température",
  unit: "C°"
)

# Entrainement sprint
training_metrics_sprint_crawl = TrainingMetric.create!(
  training_exercice_id: training_exercice_sprint_crawl.id,
  metric: "Température",
  unit: "C°"
)

training_metrics_sprint_doscrawle = TrainingMetric.create!(
  training_exercice_id: training_exercice_sprint_doscrawle.id,
  metric: "Température",
  unit: "C°"
)




# Création d'1 Seance endurance et sprint -> Table seances -------------------------------------------------------------

seance_endurance = Seance.create!(
  training_id: training_endurance.id,
  comment: "Cette séance était top ! J'ai rempli tous mes objectifs",
  rating: 5,
  duration: 45,
  date: Date.today
)

seance_sprint = Seance.create!(
  training_id: training_sprint.id,
  comment: "Bof, j'ai mal dormi la veille, j'ai pu aller jusqu'au bout ",
  rating: 2,
  duration: 30,
  date: Date.today
)




# Création d'instances TrainingVelue -> Table trainings_values ---------------------------------------------------------

# Training value pour l'entrainement endurance avec deux exo crawl et doscrawlé

# l'exercice crawl détient 5 training values définit par les métrics au-dessus : distance, vitesse, tps de repos, série + input libre température

training_values_endurance_crawl_distance = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance.id,
  value: "400"
)

training_values_endurance_crawl_vitesse = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance.id,
  value: "11"
)

training_values_endurance_crawl_tpsderepos = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance.id,
  value: "2"
)

training_values_endurance_crawl_serie = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance.id,
  value: "2"
)

training_values_endurance_crawl_temperature = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_crawl.id,
  seance_id: seance_endurance.id,
  value: "20"
)

# l'exercice doscrawlé détient 5 training values définit par les métrics au-dessus : distance, vitesse, tps de repos, série + input libre température
training_values_endurance_doscrawle_distance = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance.id,
  value: "500"
)

training_values_endurance_doscrawle_vitesse = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance.id,
  value: "12"
)

training_values_endurance_doscrawle_tpsderepos = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance.id,
  value: "2"
)

training_values_endurance_doscrawle_serie = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance.id,
  value: "2"
)

training_values_endurance_doscrawle_temperature = TrainingValue.create!(
  training_metric_id: training_metrics_endurance_doscrawle.id,
  seance_id: seance_endurance.id,
  value: "20"
)





# Training value pour l'entrainement sprint avec deux exo crawl et doscrawlé

# l'exercice crawl détient 5 training values définit par les métrics au-dessus : distance, vitesse, tps de repos, série + input libre température

training_values_sprint_crawl_distance = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint.id,
  value: "400"
)

training_values_sprint_crawl_vitesse = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint.id,
  value: "14"
)

training_values_sprint_crawl_tpsderepos = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint.id,
  value: "3"
)

training_values_sprint_crawl_serie = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint.id,
  value: "3"
)

training_values_sprint_crawl_temperature = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_crawl.id,
  seance_id: seance_sprint.id,
  value: "18"
)


# l'exercice doscrawlé détient 5 training values définit par les métrics au-dessus : distance, vitesse, tps de repos, série + input libre température

training_values_sprint_doscrawle_distance = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint.id,
  value: "500"
)

training_values_sprint_doscrawle_vitesse = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint.id,
  value: "14"
)

training_values_sprint_doscrawle_tpsderepos = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint.id,
  value: "4"
)

training_values_sprint_doscrawle_serie = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint.id,
  value: "4"
)

training_values_sprint_doscrawle_temperature = TrainingValue.create!(
  training_metric_id: training_metrics_sprint_doscrawle.id,
  seance_id: seance_sprint.id,
  value: "18"
)
