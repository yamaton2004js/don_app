class RenameCampanyColumnToTodos < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :campany, :company
  end
end
