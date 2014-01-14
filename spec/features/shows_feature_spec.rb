require 'spec_helper'

describe "Show" do 

  before do 
    @user = User.create(name: "Eric Streske", email: "estreske@gmail.com", password: "webmaster", password_confirmation: "webmaster")
    @user.should be_a User
    login_as(@user)
    @band = Band.create(name: "Shoeless Revolution", genre: "Rock/Jam", hometown_city: "Minneapolis", hometown_state: "MN", image_url: "http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg", website: "http://www.shoelessrevolution.com", user: @user)
  end

  describe "when given show information" do 

    before do 
      @date = "2014/01/18"
      @time = "8 PM"
      @slots_open = 2
      @venue_name = "Popcorn Tavern"
      @venue_street = "308 4th St. S"
      @venue_city =  "La Crosse" 
      @venue_state = "WI"
      @venue_zipcode =  54601
    end

    describe "and I visit the new show path" do 

      before do 
        visit new_show_path
        fill_in "date", with: @date
        fill_in "time", with: @time
        fill_in "slots_open", with: @slots_open
        select(@band.name, :from => 'band')
        fill_in "venue_name", with: @venue_name
        fill_in "venue_street", with: @venue_street
        fill_in "venue_city", with: @venue_city
        fill_in "venue_state", with: @venue_state
        fill_in "venue_zipcode", with: @venue_zipcode
        find_button("Create Show").click
      end

      it "should add to the database and route to correct page" do
        show = Show.where(date: "2014/01/18").last
        expect(show.time).to eq("8 PM") 
        expect(show.slots_open).to eq(2)
        expect(show.venue.name).to eq("Popcorn Tavern")
        expect(show.band.name).to eq("Shoeless Revolution")
        current_path.should == user_profile_path
      end

    
    end
  end
end