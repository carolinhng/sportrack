class AddCommentToSeance < ActiveRecord::Migration[7.1]
  def change
    add_column :seances, :comment, :string
  end
end
