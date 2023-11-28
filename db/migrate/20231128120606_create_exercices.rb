class CreateExercices < ActiveRecord::Migration[7.1]
  def change
    create_table :exercices do |t|
      t.string :name
      t.references :sport, null: false, foreign_key: true
      t.references :metric, null: false, foreign_key: true

      t.timestamps
    end
  end
end
