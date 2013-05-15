class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :description
      t.integer :client_id
      t.string :ip_id

      t.timestamps
    end
  end
end
