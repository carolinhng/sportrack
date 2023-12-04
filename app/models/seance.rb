class Seance < ApplicationRecord
  belongs_to :training
  has_many :training_values, dependent: :destroy
  has_many :training_metrics
  accepts_nested_attributes_for :training_metrics, allow_destroy: true
end
