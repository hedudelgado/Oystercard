require_relative 'oystercard.rb'
class JourneyLog

	attr_reader :current
	def initialize
		@journey = []
		@current = {}
	end

	def start_journey(station)
		# outstanding
		@current.clear
		@current[:entry] = station 
		@journey.push("entry: #{station}")
	end

	def journeys
		history
	end

	def exit_journey(station)
		@current[:exit]  = station
		@journey.push("exit: #{station}")
	end

	# def outstanding
	#  	if @journey.last == :entry then @current[:exit]= "incomplete journey, fare #{Journey::PENALTY_FARE} pounds."end	
	# end

	private

	def current_journey #a private method #current_journey should return an incomplete 
		#journey or create a new journey
		@current	
	end	
	def history
		@journey
	end
end


