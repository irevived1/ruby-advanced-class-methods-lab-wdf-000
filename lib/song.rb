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
		song = Song.new
		song.save
		song
	end

	def self.new_by_name(property_name)
		song = self.new
		song.name = property_name
		song
	end
	
	def self.create_by_name(name)
		song = Song.create
		song.name = name
		song
	end

	def self.find_by_name(name)
		@@all.each do | x |
			return x if x.name == name
		end
		return nil
	end

	def self.find_or_create_by_name(name)
		if !self.find_by_name(name)
			self.create_by_name(name)  
		else
			self.find_by_name(name)
		end
	end

	def self.alphabetical
		@@all.sort { | a , b | a.name <=> b.name }
	end	

	def self.new_from_filename(format)
		arr = format.split("-").map { |x| x.strip }
		song = Song.create_by_name(arr[1].match(/\b[\w\s]*/).to_s)
		song.artist_name = arr[0]
		song
	end
	
	def self.create_from_filename(format)
		arr = format.split("-").map { |x| x.strip }
		song = Song.create_by_name(arr[1].match(/\b[\w\s]*/).to_s)
		song.artist_name = arr[0]
		song
	end

	def self.destroy_all
		self.all.clear
	end
end

