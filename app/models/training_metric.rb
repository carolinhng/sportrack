class TrainingMetric < ApplicationRecord
  belongs_to :training_exercice
  has_many :training_values, dependent: :destroy
end
