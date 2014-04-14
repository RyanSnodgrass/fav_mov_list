require 'rspec'
require './app.rb'

describe Favorites do
	it 'should have a pre-made list' do
		Favorites.favs.should_not be_empty
	end
	it 'should add movies' do
		first_count = Favorites.favs.count
		new_movie = "casablanca"
		Favorites.add_mov(new_movie)
		second_count = Favorites.favs.count
		second_count.should > first_count
	end
end