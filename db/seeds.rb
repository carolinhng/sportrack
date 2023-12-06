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

puts "Seed success"

# Création d'une instance User
pierre = User.create!(nick_name: "Pierre", password: "azerty", email: "pierre@gmail.com")

# Création du sport (Natation)
natation = Sport.create(name: 'Natation')
user_sport = UserSport.create(user: pierre, sport: natation)

# Création des exercices
crawll = Exercice.create(name: 'Crawll', sport: natation)
dos_crawl = Exercice.create(name: 'Dos crawlé', sport: natation)
papillon = Exercice.create(name: 'Papillon', sport: natation)
brasse = Exercice.create(name: 'Brasse', sport: natation)

# Création des metrics
distance = Metric.create(metric: 'Distance', unit: 'mètre', exercice: crawll)
vitesse = Metric.create(metric: 'Vitesse', unit: 'km/h', exercice: crawll)
vitesse_moyenne = Metric.create(metric: 'Vitesse moyenne', unit: 'km/h', exercice: crawll)
temps = Metric.create(metric: 'Temps', unit: 'minutes', exercice: crawll)
temperature_eau = Metric.create(metric: "Température de l'eau", unit: 'degré', exercice: crawll)

# Création des trainings_metrics associées aux metrics
sprint = Training.create(user_sport: UserSport.first, name: 'Sprint', description: 'Entraînement de sprint')
endurance = Training.create(user_sport: UserSport.first, name: 'Endurance', description: 'Entraînement d\'endurance')

TrainingExercice.create(training: sprint, exercice: crawll, position: 1)
TrainingExercice.create(training: sprint, exercice: dos_crawl, position: 2)
TrainingExercice.create(training: endurance, exercice: papillon, position: 1)
TrainingExercice.create(training: endurance, exercice: brasse, position: 2)

# Création des séances
start_date = Date.today - 1.year
end_date = Date.today
seance_dates = (start_date..end_date).to_a.sample(200)

seance_dates.each do |date|
  training_exercice = TrainingExercice.all.sample
  seance = Seance.create(date: date, training: training_exercice.training, comment: 'Commentaire de la séance', rating: rand(1..5), duration: Time.at(rand * Time.now.to_i))

  puts "Creating Seance with ID #{seance.id} and TrainingExercice with ID #{training_exercice.id}"

  training_exercice.exercice.metrics.each do |metric|
    training_metric = TrainingMetric.create!(
      training_exercice: training_exercice,
      metric: metric.metric,
      unit: metric.unit
    )

    puts "Creating TrainingMetric with ID #{training_metric.id} for TrainingExercice with ID #{training_exercice.id}"

    TrainingValue.create!(
      training_metric: training_metric,
      seance: seance,
      value: rand(100..1000)
    )
  end
end

puts "Seed completed successfully!"
