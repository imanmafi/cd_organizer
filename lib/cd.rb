class CD

  @@all = []
  @@all_albums = []
  @@all_artists = []

  def initialize(album, artist)
    @album = album
    @artist = artist
    @id = @@all.length + 1
  end

  def wiki
    if @artist.split.length > 1
      @artist_wiki = @artist.gsub(" ", "_")
      return @artist_wiki
    else
      return @artist
    end
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
    @@all << self
    @@all_artists << self.artist
    @@all_albums << self.album
  end

  define_singleton_method(:all_albums) do
    @@all_albums
  end

  define_singleton_method(:all) do
    @@all
  end

  define_singleton_method(:all_artists) do
    @@all_artists
  end

  define_singleton_method(:clear) do
    @@all = []
    @@all_albums = []
    @@all_artists = []
  end

  define_singleton_method(:artist_album_find) do |artist|
    found_albums = []
    @@all.each do |album|
      if artist == album.artist
        found_albums << album.album
      end
    end
    found_albums
  end

  define_singleton_method(:find) do |identification|
    found_album = nil
    @@all.each do |album|
      if album.id == identification
        found_album = album
      end
    end
    found_album
  end

end
