require 'rspec'
require 'catalog'
require 'artist'
require 'album'

describe Catalog do
   before do
    Catalog.clear
  end
  it 'initializes a new instance of cd with a Album object and Artist object' do
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "Koolio"})
    test_catalog.should be_an_instance_of Catalog
    test_catalog.album.should be_an_instance_of Album
    test_catalog.artist.should be_an_instance_of Artist
  end

  describe 'merge' do
    it 'add the catalog object to the all cds hash' do
      test_catalog = Catalog.new({:artist => "Coolio"},{:album => "Koolio"})
      Catalog.all_cds.should include "Coolio"=>["Koolio"]
    end
  end

   describe 'check_artist' do
    it 'checks if a key already exists' do
      test_catalog = Catalog.new({:artist => "Coolio"},{:album => "Koolio"})
      test_catalog = Catalog.new({:artist => "Coolio"},{:album => "James Bond"})
      Catalog.all_cds.should include "Coolio" => ["James Bond", "Koolio"]
    end
  end

  describe 'list_all' do
    it 'lists each cd and artist in the hash' do
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "Koolio"})
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "James Bond"})
    test_catalog = Catalog.new({:artist => "Foolio"},{:album => "James Bond"})
    Catalog.list_all
    Catalog.all_cds.length.should eq 2
    end
  end

  describe 'search_album' do
    it 'Will search the cd catalog for an album' do
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "Koolio"})
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "James Bond"})
    test_catalog = Catalog.new({:artist => "Foolio"},{:album => "James Bond"})
    Catalog.search_for_album("Foolio").should eq "James Bond"
    end
  end

  describe 'search_artist' do
    it 'Will search the cd catalog for an artist' do
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "I'm Coolio"})
    test_catalog = Catalog.new({:artist => "Coolio"},{:album => "James Bond"})
    Catalog.search_for_artist("I'm Coolio").should eq "Coolio"
    Catalog.search_for_artist("James Bond").should eq "Coolio"
    end
  end

end

describe Artist do
  it 'initializes a new instance of artist' do
    test_artist = Artist.new({:artist => "Koolio"})
    test_artist.should be_an_instance_of Artist
  end
end

describe Album do
  it 'initializes a new instance of album' do
    test_album = Album.new({:album => "Album Album Album"})
    test_album.should be_an_instance_of Album
  end
end
