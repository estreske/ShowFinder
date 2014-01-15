class Show < ActiveRecord::Base
  attr_accessible :band_id, :date, :slots_open, :time, :venue_id, :band, :venue

  belongs_to :venue
  belongs_to :band
  has_many :requests

  def find_address(show)
    return "#{show.venue.street}, #{show.venue.city}, #{show.venue.state}"
  end

  def get_info_window_arg(show)
    arg = "<h3>Event Information</h3><br><h4>Hosted by: #{show.band.name}</h4><br><h4>Venue: #{show.venue.name}</h4><br><a href=/shows/#{show.id}>View More Information</a>"

    arg
  end

end
