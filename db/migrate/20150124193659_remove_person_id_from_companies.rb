class RemovePersonIdFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :person_id, :integer
  end
end
