class Seance < ApplicationRecord
  belongs_to :training
  has_many :training_values, dependent: :destroy
  # has_many :training_exercices, through: :trainings
  # has_many :training_metrics, through: :training_exercices
  # after_update :save_training_values
  accepts_nested_attributes_for :training_values

  private

  def save_training_values
    training_values.each do |training_value|
      training_value.save(false)
    end
  end

  validates_associated :training_values
end
