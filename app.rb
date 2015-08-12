require('sinatra')
require('sinatra/reloader')
require('./lib/cd')
also_reload('lib/**/*.rb')


get('/') do
  erb(:index)
end

get('/albums') do
  @album_list = CD.all
  erb(:albums)
end

get('/albums/new') do
  erb(:album_form)
end

post('/albums') do
  album = params.fetch('album')
  artist = params.fetch('artist')
  CD.new(album, artist).save
  @album_list = CD.all
  erb(:albums)
end

post('/clear') do
  CD.clear
  erb(:albums)
end

get('/artists/:id') do
  @album = CD.find(params.fetch('id').to_i())
  @artist = @album.artist
  @all_albums = CD.all
  erb(:artist)
end
