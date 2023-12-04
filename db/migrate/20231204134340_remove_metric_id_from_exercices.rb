class RemoveMetricIdFromExercices < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercices, :metric_id, :string
  end
end
