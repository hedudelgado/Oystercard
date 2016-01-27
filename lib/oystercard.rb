require_relative 'journey.rb'

class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	attr_reader :balance, :journey

	  def initialize
      @journey = Journey.new
    	@balance = 0
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in(station)
      raise 'not enough funds' if MIN_BALANCE > @balance
      @journey.touch_in2(station)
    end

    def touch_out(station)
      deduct(MIN_BALANCE)
      @journey.touch_out2(station)
    end

private

  def deduct(value)
  	@balance -= value
  	return value
	end

end
