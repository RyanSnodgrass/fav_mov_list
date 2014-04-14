require 'sinatra'

get "/error" do
	"whoopsies try again"
end

get "/fav_mov_app" do	
	@favs = Favorites.favs
	erb :"fav_mov/index"
end

class Favorites
	attr_reader :favs
	@@favs = {"Blade Runner" => "Super awesome Cyberpunk movie directed by Ridley Scott and starring Harrison Ford", "Fight Club" => "Super awesome movie about 'the doomed generation' fighting against each other and the established system. Starring Brad Pitt and Edward Norton"}
	def initialize
	end
	def self.favs
		@@favs
	end
	def self.add_mov(new_mov)
		@@favs.merge!(new_mov)
	end
end