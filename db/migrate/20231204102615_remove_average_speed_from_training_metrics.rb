class RemoveAverageSpeedFromTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_metrics, :average_speed, :integer
  end
end
