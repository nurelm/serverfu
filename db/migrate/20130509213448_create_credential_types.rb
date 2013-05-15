class CreateCredentialTypes < ActiveRecord::Migration
  def change
    create_table :credential_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
