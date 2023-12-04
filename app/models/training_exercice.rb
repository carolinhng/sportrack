class TrainingExercice < ApplicationRecord
  belongs_to :training
  belongs_to :exercice
  has_many :training_metrics, dependent: :destroy
  has_many :training_values
  accepts_nested_attributes_for :training_metrics, allow_destroy: true
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  # after_create :create_training_metrics, codé dans le controller

  def self.exercice?(exercice, training)
    find_by(exercice: exercice, training: training).present?
  end
end
