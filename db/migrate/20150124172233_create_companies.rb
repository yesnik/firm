class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.belongs_to :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :companies, :people
  end
end
