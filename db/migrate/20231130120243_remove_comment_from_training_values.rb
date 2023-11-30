class RemoveCommentFromTrainingValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :training_values, :comment, :string
  end
end
