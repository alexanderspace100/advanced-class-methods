class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) != name
    new_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|name| name.name}
  end

  def self.new_from_filename(mp3)
    array = mp3.split(" - ")
    artist_name = array[0]
    name = array[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(mp3)
    array = mp3.split(" - ")
    artist_name = array[0]
    name = array[1].gsub(".mp3", "")

    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end
end

