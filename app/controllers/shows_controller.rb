class ShowsController < ApplicationController 

  def new
  end

  def create
    band = Band.find(params[:band])
    venue = Venue.find_or_create_by_name_and_street_and_city_and_zipcode(name: params[:venue_name], street: params[:venue_street], city: params[:venue_city], state: params[:venue_state], zipcode: params[:venue_zipcode])
    Show.create(date: params[:date], time: params[:time], slots_open: params[:slots_open], band: band, venue: venue)
    redirect_to '/profile'
  end

  def index
    @shows = Show.all
    @hash = Gmaps4rails.build_markers(@shows) do |show, marker|
      marker.lat Geocoder.search(show.find_address(show))[0].latitude
      marker.lng Geocoder.search(show.find_address(show))[0].longitude
      arg_infowindow = show.get_info_window_arg(show)
      marker.infowindow arg_infowindow
      @center_lat = 38.5111
      @center_long = -96.8005
      @zoom = 4
    end
  end

  def city
    @venues = Venue.where(city: params[:search_city], state: params[:search_state])
      @shows = [] 
        @venues.each do |venue|
          show = Show.where(venue_id: venue.id)
          @shows << show
          @shows.flatten!
        end
      @city_bands = Band.where(hometown_city: params[:search_city], hometown_state: params[:search_state])
      @city = "#{params[:search_city]}, #{params[:search_state]}"
      @center_lat = Geocoder.search(@city)[0].latitude
      @center_long = Geocoder.search(@city)[0].longitude
      @zoom = 10
      @hash = Gmaps4rails.build_markers(@shows) do |show, marker|

        marker.lat Geocoder.search(show.find_address(show))[0].latitude
        marker.lng Geocoder.search(show.find_address(show))[0].longitude
      end
  end

  def show
    @show = Show.find(params[:id])
      @hash = Gmaps4rails.build_markers(@show) do |show, marker|

        marker.lat Geocoder.search(show.find_address(show))[0].latitude
        marker.lng Geocoder.search(show.find_address(show))[0].longitude
      end
  end

  def edit 
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    band = Band.find(params[:band])
    venue = Venue.find(@show.venue.id)
    venue.name = params[:venue_name]
    venue.street = params[:venue_street]
    venue.city = params[:venue_city]
    venue.state = params[:venue_state]
    venue.zipcode = params[:venue_zipcode]
    venue.save
    @show.date = params[:date]
    @show.time = params[:time]
    @show.slots_open = params[:slots_open]
    @show.band = band
    @show.venue = venue
    @show.save!

    redirect_to '/profile'
  end

  def destroy
    show = Show.find(params[:id])
    show.destroy
    redirect_to '/profile'
  end

end