class Venue < ActiveRecord::Base
  attr_accessible :city, :name, :state, :street, :zipcode

  has_many :shows
end
