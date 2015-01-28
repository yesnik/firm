class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.belongs_to :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :people, :companies
  end
end
