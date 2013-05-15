class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :street1
      t.string :street2
      t.string :city
      t.integer :state_id
      t.integer :contact_id
      t.string :zip

      t.timestamps
    end
  end
end
