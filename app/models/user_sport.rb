class UserSport < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :trainings
end
