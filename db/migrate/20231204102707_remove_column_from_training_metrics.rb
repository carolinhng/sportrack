class RemoveColumnFromTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_metrics, :repetition, :integer
    remove_column :training_metrics, :serie, :integer
    remove_column :training_metrics, :weight, :integer
  end
end
