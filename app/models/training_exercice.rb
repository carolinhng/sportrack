class TrainingExercice < ApplicationRecord
  belongs_to :training
  belongs_to :exercice
  has_many :training_metrics, dependent: :destroy
  has_many :training_values, through: :training_metrics
  accepts_nested_attributes_for :training_metrics, allow_destroy: true
  include PgSearch::Model
  pg_search_scope :search_exercices,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }
  before_create :add_position
  acts_as_list


  # after_create :create_training_metrics, codé dans le controller

  def self.exercice?(exercice, training)
    find_by(exercice: exercice, training: training).present?
  end

  def add_position
    last_position = TrainingExercice.last.try(:position) || 0
    self.position = last_position + 1
  end

  def training_exercice_data
    # cleaned_values = training_values.map do |training_value|
    #   # values = Hash.new({})
    #   # if values_hash.key?(training_value.training_metric.metric)
    #   #   values[:y] << training_value.value
    #   # values_hash[:]
    #   {
    #     unit: training_value.training_metric.unit,
    #     metric: training_value.training_metric.metric,
    #     x: training_value.seance.date.strftime("%d-%b"),
    #     y: training_value.value
    #   }

    # end
    {
      x: training.seances.order(id: :asc).map { |seance| seance.date.strftime("%d-%b")},
      datasets: training_values.order(seance_id: :asc)
                                .group_by{ |val| "#{val.training_metric.metric} (#{val.training_metric.unit})"  }
                                .map{ |metric, values| [metric, values.map(&:value).map(&:to_i)] }
                                .to_h.map do |metric, values|
                                  {
                                    type: 'line',
                                    label: metric,
                                    data: values
                                  }
                                end
    }

  end

  # def create_training_metrics
  #   training_metrics = TrainingMetric.new
  #   training_metrics.training_exercice_id = self.id
  #   raise
  #   training_metrics.save!
  # end
end
