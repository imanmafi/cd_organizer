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

  describe('.clear') do
    it("clears the array") do
      new_album = CD.new("Led Zeppelin IV", "Led Zeppelin")
      new_album.save
      CD.clear
      expect(CD.all).to(eq([]))
    end
  end

end
