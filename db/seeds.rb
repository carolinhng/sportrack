# Destroy existing data

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


# Création d'une instance User
pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")

# Création du sport (Natation)
natation = Sport.create!(name: 'Natation')
user_sport = UserSport.create!(user: pierre, sport: natation)

# # Création des exercices pour la natation
crawl = Exercice.create!(name: 'Crawl', sport: natation)
dos_crawle = Exercice.create!(name: 'Dos crawlé', sport: natation)
papillon = Exercice.create!(name: 'Papillon', sport: natation)
brasse = Exercice.create!(name: 'Brasse', sport: natation)

[dos_crawle, papillon, brasse].each do |exo|
  Metric.create!(metric: 'Distance', unit: 'mètre', exercice: exo)
  Metric.create!(metric: 'Vitesse', unit: 'km/h', exercice: exo)
  Metric.create!(metric: 'Vitesse moyenne', unit: 'km/h', exercice: exo)
  Metric.create!(metric: 'Temps', unit: 'minutes', exercice: exo)
  Metric.create!(metric: "Température de l'eau", unit: 'degrés', exercice: exo)
end

# Création des metrics
distance = Metric.create!(metric: 'Distance', unit: 'mètre', exercice: crawl)
vitesse = Metric.create!(metric: 'Vitesse', unit: 'km/h', exercice: crawl)
vitesse_moyenne = Metric.create!(metric: 'Vitesse moyenne', unit: 'km/h', exercice: crawl)
temps = Metric.create!(metric: 'Temps', unit: 'minutes', exercice: crawl)
temperature_eau = Metric.create!(metric: "Température de l'eau", unit: 'degrés', exercice: crawl)

# # Création des entraînements
# endurance = Training.create(user_sport: user_sport, name: 'Endurance', description: 'Entraînement axé sur l\'endurance')
# sprint = Training.create(user_sport: user_sport, name: 'Sprint', description: 'Entraînement axé sur la vitesse')


# Trainings
sprint = Training.create!(user_sport: UserSport.first, name: 'Sprint', description: 'Entraînement de sprint')
endurance = Training.create!(user_sport: UserSport.first, name: 'Endurance', description: 'Entraînement d\'endurance')

# Seances (200 séances sur une période de 1 an)
start_date = Date.today - 1.year
end_date = Date.today
seance_dates = (start_date..end_date).to_a.sample(100)


sprint_crawl = TrainingExercice.create!(training: sprint, exercice: crawl, position: 1)
sprint_dos_crawle = TrainingExercice.create!(training: sprint, exercice: dos_crawle, position: 2)
sprint_papillon = TrainingExercice.create!(training: sprint, exercice: papillon, position: 3)
sprint_brasse = TrainingExercice.create!(training: sprint, exercice: brasse, position: 4)

endurance_crawl = TrainingExercice.create!(training: endurance, exercice: crawl, position: 1)
endurance_dos_crawle = TrainingExercice.create!(training: endurance, exercice: dos_crawle, position: 2)

TrainingMetric.create!(training_exercice: sprint_crawl, metric: distance.metric, unit: "mètres")
TrainingMetric.create!(training_exercice: sprint_crawl, metric: vitesse.metric)

TrainingMetric.create!(training_exercice: sprint_dos_crawle, metric: distance.metric)
TrainingMetric.create!(training_exercice: sprint_dos_crawle, metric: vitesse.metric)

TrainingMetric.create!(training_exercice: sprint_papillon, metric: distance.metric)
TrainingMetric.create!(training_exercice: sprint_papillon, metric: vitesse.metric)

TrainingMetric.create!(training_exercice: sprint_brasse, metric: distance.metric)
TrainingMetric.create!(training_exercice: sprint_brasse, metric: vitesse.metric)

TrainingMetric.create!(training_exercice: endurance_crawl, metric: distance.metric)
TrainingMetric.create!(training_exercice: endurance_crawl, metric: vitesse.metric)

TrainingMetric.create!(training_exercice: endurance_dos_crawle, metric: distance.metric)
TrainingMetric.create!(training_exercice: endurance_dos_crawle, metric: vitesse.metric)


seance_dates.each do |date|
  seance = Seance.create!(date: date, training: [sprint, endurance].sample, comment: 'Commentaire de la séance', rating: rand(1..5), duration: Time.at(rand * Time.now.to_i))
  seance.training_metrics.each do |training_metric|
    if training_metric.metric == "Vitesse"
      TrainingValue.create(seance: seance, training_metric: training_metric, value: rand(5..25))
    elsif training_metric.metric == "Distance"
      TrainingValue.create(seance: seance, training_metric: training_metric, value: rand(100..2000))
    end
  end
end
  # TrainingsExercices avec des positions différentes
  # TrainingValues associées à chaque séance
  # TrainingExercice.where(training: seance.training).each do |training_exercice|
  #   metric_values = {}
  #   metric_values[distance] = rand(100..2000) # Distance entre 100 et 2000 mètres
  #   metric_values[vitesse] = rand(5..25) # Vitesse entre 5 et 25 km/h
  #   metric_values[vitesse_moyenne] = rand(5..20) # Vitesse moyenne entre 5 et 20 km/h
  #   metric_values[temps] = rand(10..120) # Temps entre 10 et 120 minutes
  #   metric_values[temperature_eau] = rand(10..30) # Température de l'eau entre 10 et 30 degrés

  #   metric_values.each do |_, value|
  #     TrainingValue.create!(training_metric: TrainingMetric.find_by(training_exercice: training_exercice), seance: seance, value: value)
  #   end
  # end

  # TrainingExercice.where(training: endurance).each do |training_exercice|
  #   metric_values = {}
  #   metric_values[distance] = rand(100..2000) # Distance entre 100 et 2000 mètres
  #   metric_values[vitesse] = rand(5..25)
  #   metric_values.each do |_, value|
  #     TrainingValue.create!(training_metric: TrainingMetric.find_by(training_exercice: training_exercice), seance: seance, value: value)
  #   end
  # end
# end
puts "Seed success"




# # db/seeds.rb




# # Création des entraînements_exercices
# # Pour l'endurance, ajoutons 3 exercices
# endurance_exercices = [crawl, dos_crawle, brasse]

# endurance_exercices.each_with_index do |exercice, position|
#   # Assurez-vous de lier chaque exercice à l'entraînement
#   training_exercice = TrainingExercice.create(training: endurance, exercice: exercice, position: position + 1)
#   endurance.training_exercices << training_exercice
# end

# # Pour le sprint, ajoutons 2 exercices
# sprint_exercices = [papillon, crawl]

# sprint_exercices.each_with_index do |exercice, position|
#   # Assurez-vous de lier chaque exercice à l'entraînement
#   training_exercice = TrainingExercice.create(training: sprint, exercice: exercice, position: position + 1)
#   sprint.training_exercices << training_exercice
# end

# Création des séances sur une période de deux ans (730 jours)
# 100.times do |i|
#   date = Date.today - i.days
#   training = (i % 2 == 0) ? endurance : sprint

#   seance = Seance.create(
#     date: date,
#     training: training,
#     comment: "Commentaire sur la séance du #{date}",
#     rating: rand(1..5),
#     duration: "#{rand(20..60)}:#{rand(0..59)}:#{rand(0..59)}"
#   )

#   # Création des valeurs métriques pour chaque séance
#   TrainingMetric.all.each do |metric|
#     value = case metric.metric
#             when 'Distance'
#               rand(500..1500).to_s
#             when 'Vitesse'
#               "#{rand(2..5)}.#{rand(0..9)}"
#             when 'Vitesse moyenne'
#               "#{rand(2..5)}.#{rand(0..9)}"
#             when 'Temps'
#               "#{rand(20..60)}:#{rand(0..59)}:#{rand(0..59)}"
#             when "Température de l'eau"
#               "#{rand(10..30)}.#{rand(0..9)}"
#             else
#               'N/A'
#             end

#     TrainingValue.create(
#       training_metric: metric,
#       seance: seance,
#       value: value
#     )
#   end
# end
