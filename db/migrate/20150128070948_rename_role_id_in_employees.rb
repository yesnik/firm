class RenameRoleIdInEmployees < ActiveRecord::Migration
  def change
    rename_column :employees, :role_id, :position_id
  end
end
