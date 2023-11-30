class RemoveDurationFromTrainingValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_values, :duration, :string
  end
end
