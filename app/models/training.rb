class Training < ApplicationRecord
  belongs_to :user_sport
  has_many :training_exercices
  has_many :seances
  has_one :sport, through: :user_sport
end
