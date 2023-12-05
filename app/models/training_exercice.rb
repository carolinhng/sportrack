class TrainingExercice < ApplicationRecord
  belongs_to :training
  belongs_to :exercice
  has_many :training_metrics, dependent: :destroy
  has_many :training_values, through: :training_metrics
  accepts_nested_attributes_for :training_metrics, allow_destroy: true
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }
  before_create :add_position
  acts_as_list


  # after_create :create_training_metrics, codé dans le controller

  def self.exercice?(exercice, training)
    find_by(exercice: exercice, training: training).present?
  end

  def add_position
    last_position = TrainingExercice.last.try(:position) || 0
    self.position = last_position + 1
  end

  def training_exercice_data
    training_values.map do |training_value|
      {
        unit: training_value.training_metric.unit,
        metric: training_value.training_metric.metric,
        x: training_value.created_at.strftime("%B"),
        y: training_value.value
      }
    end
  end

  # def create_training_metrics
  #   training_metrics = TrainingMetric.new
  #   training_metrics.training_exercice_id = self.id
  #   raise
  #   training_metrics.save!
  # end
end
