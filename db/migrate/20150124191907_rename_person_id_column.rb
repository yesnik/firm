class RenamePersonIdColumn < ActiveRecord::Migration
  def change
    rename_column :companies_employees, :person_id, :employee_id
  end
end
