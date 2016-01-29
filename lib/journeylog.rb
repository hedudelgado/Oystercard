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
		if @in_journey == true
			@current[:trip] = nil
			outstanding
		end
		@current[:entry_station] = station
		@in_journey = true
	
	end

	def exit_station(station)
		if @in_journey == false
			@current[:trip] = nil
			@current[:exit_station] = station
			outstanding
		else
			@current[:exit_station] = station
			#@history = @current

			@journeys.push(@current)#proper finished journey
			@in_journey = false
			@current = {}
		end

	end

private

	def current_journey
		@current
	end

	def outstanding
		
		@journeys <<  @current
		@current = {}
		@in_journey = false
		#Journey::PENALTY_FARE
		
	end

end

