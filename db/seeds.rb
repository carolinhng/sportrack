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

## Création du sport (Natation)
natation = Sport.create!(name: 'Natation')
user_sport = UserSport.create!(user: pierre, sport: natation)

## Création de faux sports (Yoga, Cyclisme)
yoga = Sport.create!(name: 'Yoga')
cyclisme = Sport.create!(name: 'Cyclisme')

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
vitesse = Metric.create!(metric: 'Vitesse moyenne', unit: 'km/h', exercice: crawl)
temps = Metric.create!(metric: 'Temps', unit: 'minutes', exercice: crawl)
temperature_eau = Metric.create!(metric: "Température de l'eau", unit: 'degrés', exercice: crawl)


# # Création des entraînements
sprint = Training.create!(user_sport: UserSport.first, name: 'Sprint', description: 'Entraînement de sprint pour ma prochaine course')
endurance = Training.create!(user_sport: UserSport.first, name: 'Endurance', description: "Entraînement d'endurance pour le Triathlon de Juin")



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
endurance_dos_papillon = TrainingExercice.create!(training: endurance, exercice: papillon, position: 3)

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

puts "Seed success"
