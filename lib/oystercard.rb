class Oystercard
	attr_reader :balance
	MAX_LIMIT = 90

	def initialize
		@balance = 0
	end

	def top_up(money)
		raise "the amount exceed #{MAX_LIMIT}" if (@balance + money) >= MAX_LIMIT
		@balance += money
	end

	def deduct(money)
		@balance -= money
	end
end
