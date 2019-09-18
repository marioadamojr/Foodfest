class CreateFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :location
      t.datetime :hours

      t.timestamps
    end
  end
end
