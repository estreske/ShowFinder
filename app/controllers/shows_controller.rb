class ShowsController < ApplicationController 

  def new
    @show = Show.new
    @bands = Band.where(user_id: current_user.id)
    @venue = Venue.new
  end

  def create
    band = Band.find(params[:band][:band_id])
    venue = Venue.find_or_create_by_name_and_street_and_city_and_zipcode(name: params[:venue][:name], street: params[:venue][:street], city: params[:venue][:city], state: params[:venue][:state], zipcode: params[:venue][:zipcode])
    Show.create(date: params[:show][:date], time: params[:show][:time], slots_open: params[:show][:slots_open], band: band, venue: venue)
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
    search_city = params[:search_city].split(" ").map(&:capitalize).join(" ")
    search_state = params[:search_state].split("").map(&:capitalize).join("")
    @venues = Venue.where(city: search_city, state: search_state)
      @shows = [] 
        @venues.each do |venue|
          show = Show.where(venue_id: venue.id)
          @shows << show
          @shows.flatten!
        end
      @city_bands = Band.where(hometown_city: search_city, hometown_state: search_state)
      @city = "#{search_city}, #{search_state}"
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
    @bands = Band.where(user_id: current_user.id)
    @venue = Venue.find(@show.venue.id)
    @show_band = [@show.band.id]
  end

  def update
    @show = Show.find(params[:id])
    @band = Band.find(params[:band][:band_id])
    @venue = Venue.find(@show.venue.id)
    @venue.name = params[:venue][:name]
    @venue.street = params[:venue][:street]
    @venue.city = params[:venue][:city]
    @venue.state = params[:venue][:state]
    @venue.zipcode = params[:venue][:zipcode]
    @venue.save!
    @show.date = params[:show][:date]
    @show.time = params[:show][:time]
    @show.slots_open = params[:show][:slots_open]
    @show.band = @band
    @show.venue = @venue
    @show.save!

    redirect_to '/profile'
  end

  def destroy
    show = Show.find(params[:id])
    show.destroy
    redirect_to '/profile'
  end

end