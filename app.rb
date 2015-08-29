require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all
  erb(:bands)
end

post('/bands') do
  new_band = Band.create({:name => params.fetch('name'), :category => params.fetch('category')})
  redirect back
end

delete('/bands/:id/delete') do
  band = Band.find(params.fetch('id').to_i)
  band.destroy
  redirect back
end

get('/bands/:id') do
  id = params.fetch('id').to_i
  @band = Band.find(id)
  @shows = @band.shows
  @venues = @band.venues
  @all_venues = Venue.all
  erb(:band)
end

patch('/bands/:id/add_venues') do
  id = params.fetch('id').to_i
  @band = Band.find(id)
  venue_ids = params.fetch('venue_ids')
  venue_ids.each() do |id|
    date = params.fetch('date')
    venue = Venue.find(id)
    show = Show.create({:band_id => @band.id, :venue_id => venue.id, :date => date})
    @band.shows.push(show)
  end
  redirect back
end

patch('/bands/:id/update_name') do
  id = params.fetch('id').to_i
  @band = Band.find(id)
  name = params.fetch('name')
  @band.update({:name => name})
  redirect back
end

#### venues
get('/venues') do
  @venues = Venue.all
  erb(:venues)
end

post('/venues') do
  name = params.fetch('name')
  city = params.fetch('city')
  state = params.fetch('state')
  location = city.concat(', ').concat(state)
  new_venue = Venue.create({:name => name, :location => location})
  redirect back
end

get('/venues/:id') do
  id = params.fetch('id').to_i
  @venue = Venue.find(id)
  @bands = @venue.bands
  @all_bands = Venue.all
  erb(:venue)
end

delete('/venues/:id/delete') do
  venue = Venue.find(params.fetch('id').to_i)

  venue.shows.each() do |show|
    show.destroy
  end

  venue.destroy
  redirect back
end
