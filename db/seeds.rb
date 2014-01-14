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

u = User.create(name: "Eric Streske", password: "webmaster", password_confirmation: "webmaster", email: "estreske@gmail.com")

u1 = User.create(name: "Fake User", password: "fakepassword", password_confirmation: "fakepassword", email: "fakeuser@gmail.com")

b = Band.create(name: "Shoeless Revolution", genre: "Rock/Jam", hometown_city: "Minneapolis", hometown_state: "MN", image_url: "http://bourbontheatre.com/wp-content/uploads/2010/11/shoelessrevolution.jpg", website: "http://www.shoelessrevolution.com", user: u)

b2 = Band.create(name: "Blah", genre: "Rock", hometown_city: "Chicago, IL", hometown_state: "IL", website: "http://www.google.com", user: u1)

v = Venue.create(name: "Popcorn Tavern", street: "308 4th St. S", city: "La Crosse", state: "WI", zipcode: 54601)

s = Show.create(date: "2014/01/18", time: "10 pm", slots_open: 1, venue: v, band: b)

r = Request.create(user: u, show: s, band: b2)