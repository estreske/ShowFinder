require 'spec_helper'

describe "#find_address" do 

  before do 
    @venue = Venue.create(name: "Popcorn Tavern", street: "308 4th St. S", city: "La Crosse", state: "WI", zipcode: 54601)

    @show = Show.create(date: "2014/01/18", time: "10 pm", slots_open: 1, venue: @venue)
  end

  it "displays a string containing the full adress of the show venue" do 

    expect(@show.find_address(@show)).to eq("308 4th St. S, La Crosse, WI")
  end
end
