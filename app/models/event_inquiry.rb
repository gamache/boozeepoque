class EventInquiry < ActiveRecord::Base
  PARAMS = %w(
    name
    company
    email
    phone
    event_date
    event_time
    event_type
    venue
    hours_required
    attendees
    cash_or_open_bar
    how_many_specialty_drinks
    budget
    serving_beer_and_wine
  )

  validates_presence_of :name, :email
end
