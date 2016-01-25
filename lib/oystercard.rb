class Oystercard
	attr_reader :balance
	MAX_LIMIT = 90
	MIN = 1

	def initialize
		@balance = 0
		@journey = false
	end

	def top_up(money)
		raise "the amount exceed #{MAX_LIMIT}" if (@balance + money) >= MAX_LIMIT
		@balance += money
	end

	def journey?
		@journey
	end

	def touch_in
		raise 'not enough founds, need to top up' if @balance < MIN
		@journey = true
	end

	def touch_out
		deduct(MIN)
		@journey = false
	end

private

	def deduct(money)
		@balance -= money
	end

end
