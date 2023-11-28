class Training < ApplicationRecord
  belongs_to :user_sports
  has_many :training_exercices
  has_many :seances
end
