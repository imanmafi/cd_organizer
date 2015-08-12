class CD

  @@all_albums = []

  def initialize(album, artist)
    @album = album
    @artist = artist
  end

  def album
    @album
  end

  def artist
    @artist
  end

  def save
    @@all_albums << self
  end

  define_singleton_method(:all) do
    @@all_albums
  end

  define_singleton_method(:clear) do
    @@all_albums = []
  end

end
