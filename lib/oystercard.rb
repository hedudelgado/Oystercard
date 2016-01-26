class Oystercard
	attr_reader :balance, :entry_station
	MAX_LIMIT = 90
	MIN = 1

	def initialize
		@entry_station
		@balance = 0
	end

	def top_up(money)
		raise "the amount exceed #{MAX_LIMIT}" if (@balance + money) >= MAX_LIMIT
		@balance += money
	end

	def journey?
		if @entry_station == nil then false else true end
	end

	def touch_in(station)
		raise 'not enough founds, need to top up' if @balance < MIN
		@journey = true
		@entry_station = station
	end

	def touch_out
		deduct(MIN)
		@journey = false
		@entry_station = nil
	end


private

	def deduct(money)
		@balance -= money
	end

end
