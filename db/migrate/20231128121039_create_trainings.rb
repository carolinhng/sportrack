class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.references :user_sport, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
