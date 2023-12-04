class TrainingMetric < ApplicationRecord
  belongs_to :training_exercice
  has_one :training_value, dependent: :destroy
end
