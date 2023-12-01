class AddBreackTimeToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :breack_time, :integer
  end
end
