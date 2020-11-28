class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :payout_price, precision: 10, scale: 2
      t.decimal :security_price, precision: 10, scale: 2
      t.decimal :total_price, precision: 10, scale: 2
      t.string :currency
      t.integer :nights_count
      t.integer :guests_count
      t.integer :adults_count
      t.integer :children_count
      t.integer :infants_count
      t.string :description
      t.string :status
      t.string :source
      t.references :guest, index: true, foreign_key: true
      t.timestamps
    end
  end
end