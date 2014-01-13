# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Band.delete_all
Venue.delete_all
Show.delete_all

u = User.create(username: "estreske", password: "webmaster", email: "estreske@gmail.com")

b = Band.create(name: "Shoeless Revolution", genre: "Rock/Jam", hometown_city: "Minneapolis", hometown_state: "MN", image_url: "http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg", user: u)

v = Venue.create(name: "Popcorn Tavern", street: "308 4th St. S", city: "La Crosse", state: "WI", zipcode: 54601)

s = Show.create(date: "01/18/2014", time: "10 pm", slots_open: 1, venue: v, band: b)