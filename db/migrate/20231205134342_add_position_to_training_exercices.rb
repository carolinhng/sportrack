class AddPositionToTrainingExercices < ActiveRecord::Migration[7.1]
  def change
    add_column :training_exercices, :position, :integer
  end
end
