class ShowsController < ApplicationController 

  def new
  end

  def create
    band = Band.find(params[:band])
    venue = Venue.find_or_create_by_name_and_street_and_city_and_zipcode(name: params[:venue_name], street: params[:venue_street], city: params[:venue_city], state: params[:venue_state], zipcode: params[:venue_zipcode])
    Show.create(date: params[:date], time: params[:time], slots_open: params[:slots_open], band: band, venue: venue)
    redirect_to '/profile'
  end

end