class Show < ActiveRecord::Base
  attr_accessible :band_id, :date, :slots_open, :time, :venue_id, :band, :venue

  belongs_to :venue
  belongs_to :band

end
