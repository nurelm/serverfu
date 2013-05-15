class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :site_id
      t.integer :credential_type_id
      t.string :domain
      t.string :username
      t.string :password
      t.string :description

      t.timestamps
    end
  end
end
