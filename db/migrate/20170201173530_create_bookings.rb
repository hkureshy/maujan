class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :service_id
      t.integer :customer_id
      t.date :booking_date
      t.time :booking_time

      t.timestamps null: false
    end
  end
end
