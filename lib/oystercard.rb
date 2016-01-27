class Card

MINIMUM_LIMIT = 1
MAXIMUM_LIMIT = 90

	attr_reader :balance, :entry_station

	def initialize
		@balance = 0
    @entry_station = nil
	end

	def top_up(amount)
		message = "You cannot exceed the £#{MAXIMUM_LIMIT} limit!"
		raise (message) if max?(amount)
		@balance += amount
	end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise 'Insufficient money on your card!' if min?
    @entry_station = station
  end

  def touch_out
    @entry_station = nil
    @balance -= MINIMUM_LIMIT
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def min?
    @balance < MINIMUM_LIMIT
  end

  def max?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

end

