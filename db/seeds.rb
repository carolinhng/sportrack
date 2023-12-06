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



# Création des sports
natation = Sport.create(name: 'Natation')


# Associer l'utilisateur au sport (Natation)
user_sport = UserSport.create(user: pierre, sport: natation)

# Création des exercices pour la natation
crawl = Exercice.create(name: 'Crawl', sport: natation)
dos_crawl = Exercice.create(name: 'Dos crawlé', sport: natation)
papillon = Exercice.create(name: 'Papillon', sport: natation)
brasse = Exercice.create(name: 'Brasse', sport: natation)

# Création des métriques
distance = Metric.create(metric: 'Distance', unit: 'mètres')
vitesse = Metric.create(metric: 'Vitesse', unit: 'm/s')
vitesse_moyenne = Metric.create(metric: 'Vitesse moyenne', unit: 'm/s')
temps = Metric.create(metric: 'Temps', unit: 'secondes')
temperature_eau = Metric.create(metric: "Température de l'eau", unit: 'degrés Celsius')

# Création des entraînements
endurance = Training.create(user_sport: user_sport, name: 'Endurance', description: 'Entraînement axé sur l\'endurance')
sprint = Training.create(user_sport: user_sport, name: 'Sprint', description: 'Entraînement axé sur la vitesse')

# Création des entraînements_exercices
# Pour l'endurance, ajoutons 3 exercices
endurance_exercices = [crawl, dos_crawl, brasse]

endurance_exercices.each_with_index do |exercice, position|
  # Assurez-vous de lier chaque exercice à l'entraînement
  training_exercice = TrainingExercice.create(training: endurance, exercice: exercice, position: position + 1)
  endurance.training_exercices << training_exercice
end

# Pour le sprint, ajoutons 2 exercices
sprint_exercices = [papillon, crawl]

sprint_exercices.each_with_index do |exercice, position|
  # Assurez-vous de lier chaque exercice à l'entraînement
  training_exercice = TrainingExercice.create(training: sprint, exercice: exercice, position: position + 1)
  sprint.training_exercices << training_exercice
end

# Création des séances
7.times do |i|
  date = Date.today - i.days
  seance = Seance.create(
    date: date,
    training: (i % 2 == 0) ? endurance : sprint,
    comment: "Commentaire sur la séance #{i + 1}",
    rating: rand(1..5),
    duration: "#{rand(20..60)}:#{rand(0..59)}:#{rand(0..59)}"
  )

  # Création des valeurs métriques pour chaque séance
  TrainingMetric.all.each do |metric|
    TrainingValue.create(
      training_metric: metric,
      seance: seance,
      value: case metric.metric
             when 'Distance'
               rand(500..1500).to_s
             when 'Vitesse'
               "#{rand(2..5)}.#{rand(0..9)}"
             when 'Vitesse moyenne'
               "#{rand(2..5)}.#{rand(0..9)}"
             when 'Temps'
               "#{rand(20..60)}:#{rand(0..59)}:#{rand(0..59)}"
             when "Température de l'eau"
               "#{rand(10..30)}.#{rand(0..9)}"
             else
               'N/A'
             end
    )
  end
end
