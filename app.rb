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
	@@favs = {"Blade Runner" => "Super awesome Cyberpunk movie directed by Ridley Scott and starring Harrison Ford", "Fight Club" => "Super awesome movie about 'the doomed generation' fighting against the established system and each other. Starring Brad Pitt and Edward Norton", "2001 Space Odyssey" => "Super trippy awesome movie directed by Stanley Kubrik showcasing a metaphorical evolution of mankind", "Spring, Summer, Fall, Winter, and Spring Again" => "Quiet meditative moving painting focusing on two monks in the ganghis mountains and the revolving nature of life."}
	def initialize
	end
	def self.favs
		@@favs
	end
	def self.add_mov(new_mov)
		@@favs.merge!(new_mov)
	end
end