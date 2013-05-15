class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :description
      t.string :phone
      t.integer :contact_id

      t.timestamps
    end
  end
end
