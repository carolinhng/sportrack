class CreateTrainingExercices < ActiveRecord::Migration[7.1]
  def change
    create_table :training_exercices do |t|
      t.references :training, null: false, foreign_key: true
      t.references :exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
