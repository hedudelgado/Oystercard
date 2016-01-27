class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	attr_reader :balance, :journey_history, :entry_station

	  def initialize
    	@balance = 0
      	@journey_history = {}
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in(station)
      raise 'not enough funds' if MIN_BALANCE > @balance
      @entry_station = station
      @journey_history[:entry_station] =  station
    end

    def touch_out(station)
      @journey_history[:exit_station] =  station 
      deduct(MIN_BALANCE)
      @entry_station = nil
    end

    def in_journey?
      !!@entry_station
    end

private

    def deduct(value)
  		@balance -= value
  		return value
  	end
end
