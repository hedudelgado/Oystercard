class JourneyLog

	attr_reader :current_journey

	def initialize
		@journey = []
		@current_journey = {}
	end

	def start_journey(station)
		@current_journey.clear
		@current_journey[:entry] = station
		@journey.push("entry: #{station}")
	end

	def journeys
		history
	end

	def exit_journey(station)
		@current_journey[:exit]  = station
		@journey.push("exit: #{station}")
	end

	private

	def history
		@journey
	end
end


