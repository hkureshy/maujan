class CreateBookingServices < ActiveRecord::Migration
  def change
    create_table :booking_services do |t|
      t.integer :service_id
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
