class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	  attr_reader :balance, :entry_station

	  def initialize
    	@balance = 0
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in(station)
      raise 'not enough funds' if MIN_BALANCE > @balance
      @entry_station = station
    end

    def touch_out
      deduct(MIN_BALANCE)
      @entry_station = nil
    end

    def in_journey?
      if @entry_station == nil then false else true end
    end

private
    
    def deduct(value)
  		@balance -= value
  		return value
  	end
end
