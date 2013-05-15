class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :noteable_id
      t.string :noteable_type

      t.timestamps
    end
  end
end
