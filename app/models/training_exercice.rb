class TrainingExercice < ApplicationRecord
  belongs_to :training
  belongs_to :exercice
  has_one :training_metric, dependent: :destroy
  has_many :training_values
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  # after_create :create_training_metrics

  def self.exercice?(exercice, training)
    find_by(exercice: exercice, training: training).present?
  end

  # def create_training_metrics
  #   training_metrics = TrainingMetric.new
  #   training_metrics.training_exercice_id = self.id
  #   raise
  #   training_metrics.save!
  # end

end
