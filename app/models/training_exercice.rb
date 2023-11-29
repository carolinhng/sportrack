class TrainingExercice < ApplicationRecord
  belongs_to :training
  belongs_to :exercice
  has_many :training_metrics
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }
end
