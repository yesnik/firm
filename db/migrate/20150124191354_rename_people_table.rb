class RenamePeopleTable < ActiveRecord::Migration
  def change
  	rename_table :people, :employees
  	rename_table :companies_people, :companies_employees
  end
end
