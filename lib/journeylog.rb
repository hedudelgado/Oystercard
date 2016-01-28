require_relative 'oystercard.rb'
require_relative 'Journey'

class JourneyLog

	attr_reader :current
	def initialize
		@journey = []
		@current = {}
		@completetracker = nil
	end

	def start_journey(station)
		@current.clear
		if 	complete_in? then save_in_good(station) else save_in_penalty(station) end
	end
	
	def journeys
		history
	end

	def exit_journey(station)
		if  complete_exit? then save_exit_good(station) else save_exit_penalty(station) end
	end


	private

	def save_exit_penalty(station)
		outstanding_charges
		@journey.push("exit: #{station}")
		@completetracker = nil
	end


	def save_exit_good(station)
		@current[:exit]  = station
		@journey.push("exit: #{station}")
		@completetracker = nil
	end

	def save_in_penalty(station)
		outstanding_charges
		@journey.push("entry: #{station}")
		@completetracker = true
	end

	def outstanding_charges
		@journey.push("incomplete journey, #{Journey::PENALTY_FARE} pounds")
	end

	def save_in_good(station)
		@current[:entry] = station 
		@journey.push("entry: #{station}")
		@completetracker = true
	end

	def current_journey #a private method #current_journey should return an incomplete 
		#journey or create a new journey
		@current	
	end	
	def history
		@journey
	end
	def complete_exit?
		@completetracker == true
	end
	def complete_in?
		@completetracker == nil
	end

end


