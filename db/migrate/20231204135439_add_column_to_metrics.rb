class AddColumnToMetrics < ActiveRecord::Migration[7.1]
  def change
    add_column :metrics, :metric, :string
    add_column :metrics, :unit, :string
    add_reference :metrics, :exercice, foreign_key: true
  end
end
