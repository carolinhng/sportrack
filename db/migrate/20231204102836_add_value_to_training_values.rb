class AddValueToTrainingValues < ActiveRecord::Migration[7.1]
  def change
    add_column :training_values, :value, :string
  end
end
