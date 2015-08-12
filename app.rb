require('sinatra')
require('sinatra/reloader')
require('./lib/cd')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end

get('/albums') do
  @album_list
  erb(:albums)
end

get('/albums/new') do
  erb(:album_form)
end

post('/album_create') do
  album = params.fetch('album')
  artist = params.fetch('artist')
  CD.new(album, artist).save
  @album_list = CD.all
  erb(:albums)
end
