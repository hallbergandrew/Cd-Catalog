require './lib/artist'
require './lib/album'


class Catalog
  @@all_cds = {}

  attr_reader :artist, :album

  def initialize(artist, album)
    @artist = artist
    @album = album
    @artist = Artist.new(artist)
    @album = Album.new(album)
    check_artist
  end

  def check_artist
    if @@all_cds.empty?
      merge
    elsif @@all_cds[@artist.name]
      @@all_cds.keys.each do |key|
        key == @artist.name
        @album.albums_arr << @@all_cds[key].join
      end
      merge
    else
      merge
    end
  end

  def merge
    @@all_cds = @@all_cds.merge( @artist.name => @album.albums_arr)
  end

  def list_all
    @@all_cds.each do |key, value|
      puts key.to_s + " - " + value.join(", ")
    end
  end

  def search_for_album(artist)
    @@all_cds[artist].join(", ")
  end

  def search_for_artist(album)
    answer = ""
    @@all_cds.each do |key, value|
          @@all_cds[key].each do |string|
            if string == album
              answer = key
            end
          end
        end
    answer
  end

  def Catalog.clear
    @@all_cds = {}
  end

  def Catalog.all_cds
    @@all_cds
  end
end


