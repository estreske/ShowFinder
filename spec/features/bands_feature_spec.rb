require 'spec_helper'

describe "Band" do 
  before do 
    @user = User.create(name: "Eric Streske", email: "estreske@gmail.com", password: "webmaster", password_confirmation: "webmaster")
    @user.should be_a User
    login_as(@user)
  end

  describe "when given band information" do 

    before do 
      @name = "Shoeless Revolution"
      @genre = "Rock/Jam"
      @hometown_city = "Minneapolis"
      @hometown_state = "MN"
      @image_url = "http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg"
      @website = "http://www.shoelessrevolution.com"
    end

      describe "when I visit the new band path" do 

        before do
          visit new_band_path
          fill_in "name", with: @name
          fill_in "genre", with: @genre
          fill_in "hometown_city", with: @hometown_city
          fill_in "hometown_state", with: @hometown_state
          fill_in "image_url", with: @image_url
          fill_in "website", with: @website
          find_button("Add Band").click
        end

        it "should add the band to the database" do 

          band = Band.find_by_name("Shoeless Revolution")
          expect(band.genre).to eq("Rock/Jam")
          expect(band.hometown_city).to eq("Minneapolis")
          expect(band.hometown_state).to eq("MN")
          expect(band.image_url).to eq("http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg")
          expect(band.website).to eq("http://www.shoelessrevolution.com")
          current_path.should == user_profile_path
        end

      end
  end
end