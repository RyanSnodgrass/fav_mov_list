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
	@@favs = ["Blade Runner", "Fight Club"]
	def initialize
	end
	def self.favs
		@@favs
	end
	def self.add_mov(new_mov)
		@@favs.push(new_mov)
	end
end