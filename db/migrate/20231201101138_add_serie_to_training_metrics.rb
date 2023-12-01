class AddSerieToTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :training_metrics, :serie, :integer
  end
end
