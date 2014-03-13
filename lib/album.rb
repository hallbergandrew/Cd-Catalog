class Album
  attr_reader :album

  def initialize(album)
    @album = album[:album]
    @albums_arr = []
    @albums_arr << @album
  end

  def albums_arr
    @albums_arr
  end

  def Album.add_album
    @albums_arr << self.album
  end
end
