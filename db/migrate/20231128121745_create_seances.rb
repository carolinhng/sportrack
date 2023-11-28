class CreateSeances < ActiveRecord::Migration[7.1]
  def change
    create_table :seances do |t|
      t.date :date
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
