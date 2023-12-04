class RemoveColumnFromMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :metrics, :average_speed, :integer
    remove_column :metrics, :repetition, :integer
    remove_column :metrics, :serie, :integer
    remove_column :metrics, :weight, :integer
    remove_column :metrics, :breack_time, :time
  end
end
