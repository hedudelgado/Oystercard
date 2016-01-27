require_relative 'oystercard.rb'

class Journey

	attr_reader :journey_history, :entry_station
	PENALTY_FARE = 6

	def fare
		if penalty? then PENALTY_FARE else OysterCard::MIN_BALANCE end
	end
	def initialize
		@journey_history = {}
	end
	def touch_in2(station)
		@journey_history[:entry_station] =  station
		touch_in_penalty
		@entry_station = station	
	end
	def touch_out2(station)
		@journey_history[:exit_station]  =  station 
		touch_out_penalty
		@entry_station = nil
	end
private    
	def penalty?
		@penalty
	end

    def in_journey?
    	!!@entry_station
    end
    
    def touch_out_penalty
    	if in_journey? then @penalty = false else @penalty = true end	
    end
    def touch_in_penalty
    	if in_journey? then @penalty = true else @penalty = false end	
    end
end




