require 'sinatra'

get "/error" do
	"whoopsies try again"
end

get "/fav_mov_app" do	
	@favorites = Favorites.new
	erb :"fav_mov/index"
end

class Favorites
	@@favs = ["Blade Runner", "Fight Club"]
	def initialize
	end
	def self.favs
		@@favs
	end
end