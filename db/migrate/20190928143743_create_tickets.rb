class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :festival_id
      t.integer :user_id

      t.timestamps
    end
  end
end
