class AddRepetitionToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :repetition, :integer
  end
end
