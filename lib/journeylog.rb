require_relative 'oystercard.rb'
require_relative 'Journey'

class JourneyLog 

	attr_reader :current, :journeys

	def initialize
		@current = {}
		@journeys = []
		@in_journey = false
	end

	def start_journey(station)
		if @in_journey == true then	bad_in end
		@current[:entry_station] = station
		@in_journey = true
	end

	def exit_station(station)
		if @in_journey == false then bad_exit(station) else good_exit(station) end
	end

private

	def current_journey
		@current
	end

	def outstanding
		@journeys <<  @current
		@current = {}
		@in_journey = false
		Journey::PENALTY_FARE
	end
	def bad_exit(station)
		@current[:trip] = nil
		@current[:exit_station] = station
		outstanding
	end
	def good_exit(station)
		@current[:exit_station] = station
		#@history = @current
		@journeys.push(@current)
		@in_journey = false
		@current = {}
	end
	def bad_in
		@current[:trip] = nil 
		outstanding
	end
end	

