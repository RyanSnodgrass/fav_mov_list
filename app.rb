require 'sinatra'

#RACK_ENV=production rackup config.ru
get "/error" do
	"whoopsies try again"
end

get "/addition" do
	erb :"fav_mov/addition_index"
end

get "/fav_mov_app" do	
	@favs = Favorites.favs
	erb :"fav_mov/index"
end

get "/remove" do
	@favs = Favorites.favs
	erb :"fav_mov/remove_index"
end

post "/favs" do
	name = params[:mov_name]
	description = params[:mov_desc]
	movie = {name => description}

	Favorites.add_mov(movie)
	redirect "./fav_mov_app"
end

class Favorites
	attr_reader :favs
	@@favs = {"Blade Runner" => "Super awesome Cyberpunk movie directed by Ridley Scott and starring Harrison Ford", "Fight Club" => "Super awesome movie about 'the doomed generation' fighting against the established system and each other. Starring Brad Pitt and Edward Norton", "2001 Space Odyssey" => "Super trippy awesome movie directed by Stanley Kubrik showcasing a metaphorical evolution of mankind", "Spring, Summer, Fall, Winter, and Spring Again" => "Quiet and meditative moving painting focusing on two monks in the ganghis mountains and the revolving nature of life."}
	def initialize
	end
	def self.favs
		@@favs
	end
	def self.add_mov(new_mov)
		@@favs.merge!(new_mov)
	end
end