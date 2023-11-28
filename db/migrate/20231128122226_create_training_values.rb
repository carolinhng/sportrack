class CreateTrainingValues < ActiveRecord::Migration[7.1]
  def change
    create_table :training_values do |t|
      t.string :comment
      t.integer :rating
      t.date :date
      t.time :duration
      t.references :training_metric, null: false, foreign_key: true
      t.references :seance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
