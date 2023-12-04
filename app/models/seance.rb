class Seance < ApplicationRecord
  belongs_to :training
  has_many :training_values, dependent: :destroy

  def metricspoints(training_metric)

    training_values.where(training_metric: training_metric).map do |training_value|
      {
        x: training_value.created_at.strftime("%B"),
        y: training_value.value
      }
    end
  end
end
