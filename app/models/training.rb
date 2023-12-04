class Training < ApplicationRecord
  belongs_to :user_sport
  has_many :training_exercices, dependent: :destroy
  has_many :training_metrics, through: :training_exercices
  has_many :training_values, through: :training_metrics
  has_many :seances, dependent: :destroy
  has_one :sport, through: :user_sport
  has_many :exercices, through: :training_exercices, dependent: :destroy

end
