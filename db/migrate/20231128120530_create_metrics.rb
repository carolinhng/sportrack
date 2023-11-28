class CreateMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :metrics do |t|
      t.integer :duration
      t.integer :average_speed
      t.integer :repetition
      t.integer :serie
      t.integer :weight
      t.time :breack_time

      t.timestamps
    end
  end
end
