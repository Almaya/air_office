module ApplicationHelper
  def resolve_booking_form_options(booking)
    if booking.new_record?
      { url: bookings_path, action: 'create' }
    else
      { url: booking_path, action: 'update' }
    end
  end
end
