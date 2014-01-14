class Show < ActiveRecord::Base
  attr_accessible :band_id, :date, :slots_open, :time, :venue_id, :band, :venue

  belongs_to :venue
  belongs_to :band
  has_many :requests

  def find_address(show)
    return "#{show.venue.street}, #{show.venue.city}, #{show.venue.state}"
  end
end
