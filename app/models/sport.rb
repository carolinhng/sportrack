class Sport < ApplicationRecord
  has_many :user_sports
  has_many :exercices
  has_many :trainings, through: :user_sports
end
