class CreateTrainingMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :training_metrics do |t|
      t.references :training_exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
