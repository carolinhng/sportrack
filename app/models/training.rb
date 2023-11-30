class Training < ApplicationRecord
  belongs_to :user_sport
  has_many :training_exercices
  has_many :seances
  has_one :sport, through: :user_sport
  has_many :exercices, through: :training_exercices

  accepts_nested_attributes_for :training_exercices,
                                allow_destroy: true,
                                reject_if: :all_blank
end
