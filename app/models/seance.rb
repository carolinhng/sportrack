class Seance < ApplicationRecord
  belongs_to :training
  has_many :training_values
end
