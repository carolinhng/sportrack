class Exercice < ApplicationRecord
  belongs_to :sport
  belongs_to :metric
  has_many :training_exercices

end
