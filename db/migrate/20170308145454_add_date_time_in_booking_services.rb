class AddDateTimeInBookingServices < ActiveRecord::Migration
  def change
    add_column :booking_services, :booking_date, :string
    add_column :booking_services, :booking_time, :string
  end
end
