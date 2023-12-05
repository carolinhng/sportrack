class Seance < ApplicationRecord
  belongs_to :training
  has_many :training_values, dependent: :destroy
  has_many :training_exercices, through: :trainings
  has_many :training_metrics, through: :training_exercices
  # after_update :save_training_values
  accepts_nested_attributes_for :training_values
  validates_associated :training_values

  private

  def save_training_values
    training_values.each do |training_value|
      training_value.save(false)
    end
  end

  def metricspoints(training_metric)

    training_values.where(training_metric: training_metric).map do |training_value|
      {
        x: training_value.created_at.strftime("%B"),
        y: training_value.value
      }
    end
  end
end
