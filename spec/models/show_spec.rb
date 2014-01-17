require 'spec_helper'

describe "when given show, venue, and band information" do

before :each do 
    @venue = Venue.create(name: "Popcorn Tavern", street: "308 4th St. S", city: "La Crosse", state: "WI", zipcode: 54601)

    @band = Band.create(name: "Shoeless Revolution", genre: "Rock/Jam", hometown_city: "Minneapolis", hometown_state: "MN", image_url: "http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg", website: "http://www.shoelessrevolution.com")

    @show = Show.create(date: "2014/01/18", time: "10 pm", slots_open: 1, venue: @venue, band: @band)
  end


describe "#find_address" do 

  it "displays a string containing the full adress of the show venue" do 

    expect(@show.find_address(@show)).to eq("308 4th St. S, La Crosse, WI")
  end
end

describe "#get_info_window_arg" do

  it "should return a string of html data related to the show" do

  expect(@show.get_info_window_arg(@show)).to eq("<h5>Event Information</h5><h5>Hosted by: Shoeless Revolution<h5>Venue: Popcorn Tavern</h5><br><a href=/shows/2>View More Information</a>")
  end
end
end
