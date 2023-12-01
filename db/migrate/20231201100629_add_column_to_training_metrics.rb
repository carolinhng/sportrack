class AddDurationToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :duration, :integer
  end
end
