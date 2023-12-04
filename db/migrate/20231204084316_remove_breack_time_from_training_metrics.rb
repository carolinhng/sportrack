class RemoveBreackTimeFromTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_metrics, :breack_time, :integer
  end
end
