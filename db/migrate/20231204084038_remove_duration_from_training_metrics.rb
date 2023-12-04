class RemoveDurationFromTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_metrics, :duration, :integer
  end
end
