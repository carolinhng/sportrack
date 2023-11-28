class Sport < ApplicationRecord
  has_many :user_sports
  has_many :exercices
end
