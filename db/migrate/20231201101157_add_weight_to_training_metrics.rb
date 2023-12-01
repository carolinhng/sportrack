class AddWeightToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :weight, :integer
  end
end
