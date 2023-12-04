class RemoveDurationnFromMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :metrics, :duration, :integer
  end
end
