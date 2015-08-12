class CD

  @@all_albums = []

  def initialize(album, artist)
    @album = album
    @artist = artist
    @id = @@all_albums.length + 1
  end

  def album
    @album
  end

  def artist
    @artist
  end

  def id
    @id
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

  define_singleton_method(:find) do |identification|
    found_album = nil
    @@all_albums.each do |album|
      if album.id == identification
        found_album = album
      end
    end
    found_album
  end

end
