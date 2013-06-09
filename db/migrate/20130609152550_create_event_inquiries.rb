class CreateEventInquiries < ActiveRecord::Migration
  def change
    create_table :event_inquiries do |t|
    %w(
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
      ).each do |col|
        t.string col
      end

      t.timestamps
    end
  end
end
