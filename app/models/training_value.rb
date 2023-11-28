class TrainingValue < ApplicationRecord
  belongs_to :training_metric
  belongs_to :seance
end
