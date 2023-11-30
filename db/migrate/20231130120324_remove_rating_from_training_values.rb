class RemoveRatingFromTrainingValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_values, :rating, :string
  end
end
