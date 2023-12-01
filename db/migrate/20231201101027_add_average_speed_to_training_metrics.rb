class AddAverageSpeedToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :average_speed, :integer
  end
end
