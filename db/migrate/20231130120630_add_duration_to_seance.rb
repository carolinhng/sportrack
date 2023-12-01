class AddDurationToSeance < ActiveRecord::Migration[7.1]
  def change
    add_column :seances, :duration, :time
  end
end
