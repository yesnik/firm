class CreateCompaniesPeopleTable < ActiveRecord::Migration
  def change
    create_table :companies_people do |t|
      t.belongs_to :person, index: true
      t.belongs_to :company, index: true

      t.timestamps null: false
    end
  end
end
