class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :description
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :contactable_id
      t.string :contactable_type

      t.timestamps
    end
  end
end
