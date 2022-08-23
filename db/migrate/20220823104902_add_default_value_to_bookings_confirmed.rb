class AddDefaultValueToBookingsConfirmed < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :confirmed, false
  end
end
