class Show < ActiveRecord::Base
  attr_accessible :band_id, :date, :slots_open, :time, :venue_id, :band, :venue

  belongs_to :venue
  belongs_to :band
  has_many :requests

  def find_address(show)
    return "#{show.venue.street}, #{show.venue.city}, #{show.venue.state}"
  end

  def get_info_window_arg(show)
    arg = "<h5>Event Information</h5><h5>Hosted by: #{show.band.name}<h5>Venue: #{show.venue.name}</h5><br><a href=/shows/#{show.id}>View More Information</a>"

    arg
  end

end
