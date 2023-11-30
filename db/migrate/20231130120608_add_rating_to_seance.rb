class AddRatingToSeance < ActiveRecord::Migration[7.1]
  def change
    add_column :seances, :rating, :integer
  end
end
