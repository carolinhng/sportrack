class AddDurationToSeances < ActiveRecord::Migration[7.1]
  def change
    add_column :seances, :duration, :integer
  end
end
