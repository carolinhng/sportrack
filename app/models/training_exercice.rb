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

  after_create :create_training_metrics

  def self.exercice?(exercice, training)
    find_by(exercice: exercice, training: training).present?
  end

  def create_training_metrics
    training_metrics = TrainingMetrics.new
    training_metrics.training_exercices.id = self.id
  end


end
