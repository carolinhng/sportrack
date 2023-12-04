class AddColumnToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :metric, :string
    add_column :training_metrics, :unit, :string
  end
end
