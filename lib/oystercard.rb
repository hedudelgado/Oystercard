class Oystercard
	attr_reader :balance
	MAX_LIMIT = 90

	def initialize
		@balance = 0
		@journey = false
	end

	def top_up(money)
		raise "the amount exceed #{MAX_LIMIT}" if (@balance + money) >= MAX_LIMIT
		@balance += money
	end

	def deduct(money)
		@balance -= money
	end

	def journey?
		@journey
	end

	def touch_in
		@journey = true
	end

	def touch_out
		@journey = false
	end


end
