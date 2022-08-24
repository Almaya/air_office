module ApplicationHelper
  def resolve_booking_form_options(booking)
    if booking.new_record?
      { url: workspace_bookings_path, action: 'create' }
    else
      { url: workspace_booking_path, action: 'update' }
    end
  end
end
