require 'pry'
class Song
  self.attr_accessor :name, :artist_name #I wrotre this line
  attr_accessor :name, :artist_name
  @@all = []

  def name
    @name
  end
# I added the methods above and below this comment;
  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new.save
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    #binding.pry
    song.name = name
  end

  def self.create_by_name(name)
    self.create
    @name = name
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
     self.find_by_name
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|song1, song2| song1 <=> song2}
  end

  def self.new_from_filename(file)
    file.split("-", 4)
    name = file[2]
    artist_name = file[1]

    Song.new(name, artist_name)
    @name = name
    @artist_name = artist_name
  end

  def self.create_from_filename(name)
    name.split("-", 4)
    @name = name[2]
    @artist_name = name[1]

    self.create(name)
  end

  def self.destroy_all
    @@all.clear
  end

end
