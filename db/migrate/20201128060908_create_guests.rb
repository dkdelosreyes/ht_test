class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :external_id
      t.timestamps

      t.index :email, unique: true
    end
  end
end
