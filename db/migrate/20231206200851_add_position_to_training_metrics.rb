class AddPositionToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :position, :integer
  end
end
