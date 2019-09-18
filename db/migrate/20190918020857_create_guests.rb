class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :festival_id
      t.integer :money
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
