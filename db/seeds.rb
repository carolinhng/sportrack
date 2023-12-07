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

yoga = Sport.create!(name: 'Yoga')
cyclisme = Sport.create!(name: 'Cyclisme')
natation = Sport.create!(name: 'Natation')
user_sport = UserSport.create!(user: pierre, sport: natation)
UserSport.create!(user: pierre, sport: yoga)
UserSport.create!(user: pierre, sport: cyclisme)

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
# vitesse_moyenne = Metric.create!(metric: 'Vitesse moyenne', unit: 'km/h', exercice: crawl)
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

TrainingMetric.create!(training_exercice: sprint_crawl, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: sprint_crawl, metric: vitesse.metric, unit: "km/h", position: 2)

TrainingMetric.create!(training_exercice: sprint_dos_crawle, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: sprint_dos_crawle, metric: vitesse.metric, unit: "km/h", position: 2)

TrainingMetric.create!(training_exercice: sprint_papillon, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: sprint_papillon, metric: vitesse.metric, unit: "km/h", position: 2)

TrainingMetric.create!(training_exercice: sprint_brasse, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: sprint_brasse, metric: vitesse.metric, unit: "km/h", position: 2)

TrainingMetric.create!(training_exercice: endurance_crawl, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: endurance_crawl, metric: vitesse.metric, unit: "km/h", position: 2)

TrainingMetric.create!(training_exercice: endurance_dos_crawle, metric: distance.metric, unit: "mètres", position: 1)
TrainingMetric.create!(training_exercice: endurance_dos_crawle, metric: vitesse.metric, unit: "km/h", position: 2)


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

puts "Seed natation success"
#------------------------------------------------------------------------------------------------------------
# Destroy existing data

## Création du sport (Musculation)
musculation = Sport.create!(name: 'Musculation')
pierre_muscu = UserSport.create!(user: pierre, sport: musculation)

# Création des exercices pour la musculation
squat = Exercice.create!(name: 'Squat', sport: musculation)
presse_jambes = Exercice.create!(name: 'Presse Jambes', sport: musculation)
developpe_couché = Exercice.create!(name: 'Developpé Couché', sport: musculation)
tirage_horizontal = Exercice.create!(name: 'Tirage Horizontal', sport: musculation)
curl_biceps = Exercice.create!(name: 'Curl Biceps', sport: musculation)
extension_triceps = Exercice.create!(name: 'Extension Triceps', sport: musculation)
elevation_laterale = Exercice.create!(name: 'Élévation Latérale', sport: musculation)

[squat, presse_jambes, developpe_couché, tirage_horizontal, curl_biceps, extension_triceps, elevation_laterale].each do |exo|
  Metric.create!(metric: 'Repetitions', unit: 'reps', exercice: exo)
  Metric.create!(metric: 'Poids', unit: 'kg', exercice: exo)
  Metric.create!(metric: 'Series', unit: 'series', exercice: exo)
end

# Création des métriques
repetitions = Metric.create!(metric: 'Repetitions', unit: 'reps', exercice: squat)
poids_leve = Metric.create!(metric: 'Poids', unit: 'kg', exercice: squat)
series_terminees = Metric.create!(metric: 'Series', unit: 'series', exercice: squat)

# Création des entraînements
force = Training.create!(user_sport: pierre_muscu, name: 'Entraînement de Force', description: 'Entraînement de musculation axé sur le développement de la force')
hypertrophie = Training.create!(user_sport: pierre_muscu, name: 'Entraînement d\'Hypertrophie', description: 'Entraînement de musculation pour stimuler la croissance musculaire')


# Séances (50 séances sur une période de 6 mois)
start_date = Date.today - 6.months
end_date = Date.today
seance_dates = (start_date..end_date).to_a.sample(50)

# Création des TrainingExercice
squat_training = TrainingExercice.create!(training: force, exercice: squat, position: 1)
presse_jambes_training = TrainingExercice.create!(training: force, exercice: presse_jambes, position: 2)
developpe_couché_training = TrainingExercice.create!(training: force, exercice: developpe_couché, position: 3)
tirage_horizontal_training = TrainingExercice.create!(training: force, exercice: tirage_horizontal, position: 4)

curl_biceps_training = TrainingExercice.create!(training: hypertrophie, exercice: curl_biceps, position: 1)
extension_triceps_training = TrainingExercice.create!(training: hypertrophie, exercice: extension_triceps, position: 2)
elevation_laterale_training = TrainingExercice.create!(training: hypertrophie, exercice: elevation_laterale, position: 3)


# Création des TrainingMetric
TrainingMetric.create!(training_exercice: squat_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: squat_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: squat_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: presse_jambes_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: presse_jambes_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: presse_jambes_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: developpe_couché_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: developpe_couché_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: developpe_couché_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: tirage_horizontal_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: tirage_horizontal_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: tirage_horizontal_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: curl_biceps_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: curl_biceps_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: curl_biceps_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: extension_triceps_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: extension_triceps_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: extension_triceps_training, metric: series_terminees.metric, unit: "series")

TrainingMetric.create!(training_exercice: elevation_laterale_training, metric: repetitions.metric, unit: "reps")
TrainingMetric.create!(training_exercice: elevation_laterale_training, metric: poids_leve.metric, unit: "kg")
TrainingMetric.create!(training_exercice: elevation_laterale_training, metric: series_terminees.metric, unit: "series")


seance_dates.each do |date|
  seance = Seance.create!(date: date, training: [force, hypertrophie].sample, comment: 'Commentaire de la séance', rating: rand(1..5), duration: Time.at(rand * Time.now.to_i))
  seance.training_metrics.each do |training_metric|
      case training_metric.metric
      when "Repetitions"
        TrainingValue.create(seance: seance, training_metric: training_metric, value: rand(5..15))
      when "Poids"
        TrainingValue.create(seance: seance, training_metric: training_metric, value: rand(20..100))
      when "Series"
        TrainingValue.create(seance: seance, training_metric: training_metric, value: rand(3..5))
    end
  end
end

puts "Seed muscu ok"
