class CreateTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :trucks do |t|
      t.string :name
      t.integer :festival_id

      t.timestamps
    end
  end
end
