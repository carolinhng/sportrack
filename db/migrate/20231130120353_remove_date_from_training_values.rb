class RemoveDateFromTrainingValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_values, :date, :string
  end
end
