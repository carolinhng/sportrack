class Exercice < ApplicationRecord
  belongs_to :sport
  has_many :metrics
  has_many :training_exercices
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

end
