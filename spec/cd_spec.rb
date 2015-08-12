require('rspec')
require('cd')

describe (CD) do

  before do
    CD.clear
  end

  describe('#album') do
    it("returns the name of the album") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      expect(new_album.album).to(eq("Led Zeppelin IV"))
    end
  end

  describe('#artist') do
    it("returns the name of the album") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      expect(new_album.artist).to(eq("Led Zeppelin"))
    end
  end

  describe('#id') do
    it("returns the id of the album") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      expect(new_album.id).to(eq(1))
    end
  end

  describe('.all') do
    it("returns an empty array before anything is added") do
      expect(CD.all).to(eq([]))
    end
  end

  describe('.all_artists') do
    it("returns list of artists") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      new_album_2 = CD.new("Drones", "Muse")
      new_album_2.save
      expect(CD.all_artists).to(eq(["Led Zeppelin", "Muse"]))
    end
  end

  describe('.clear') do
    it("clears the array") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      CD.clear
      expect(CD.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds the album based on id") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      new_album_2 = CD.new("Drones", "Muse")
      new_album_2.save
      expect(CD.find(new_album_2.id)).to(eq(new_album_2))
    end
  end

  describe('.artist_album_find') do
    it("finds all albums by one artist") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      new_album_3 = CD.new("Led Zeppelin III", "Led Zeppelin")
      new_album_3.save
      new_album_4 = CD.new("Led Zeppelin II", "Led Zeppelin")
      new_album_4.save
      new_album_2 = CD.new("Drones", "Muse")
      new_album_2.save
      expect(CD.artist_album_find("Led Zeppelin")).to(eq(["Led Zeppelin IV", "Led Zeppelin III", "Led Zeppelin II"]))
    end
  end

end
