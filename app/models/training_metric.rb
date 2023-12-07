class TrainingMetric < ApplicationRecord
  belongs_to :training_exercice
  has_many :training_values, dependent: :destroy
  acts_as_list
end
