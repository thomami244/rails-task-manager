class ChangeColumnNameTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :detailstext, :details
  end
end
