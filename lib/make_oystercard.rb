class OysterCard

  	MAX_BALANCE = 90
	attr_reader :balance

	def initialize
    	@balance = 0
      @in_journey = false
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

  	def deduct(value)
  		@balance -= value
  		return value
  	end

    def touch_in
      @in_journey = true
    end

    def touch_out
      @in_journey = false
    end

    def in_journey?
      @in_journey
    end
end
