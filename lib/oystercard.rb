require_relative 'journey'

class Card

MINIMUM_LIMIT = 1
MAXIMUM_LIMIT = 90

	attr_reader :balance, :new_journey

	def initialize
		@balance = 0
    @new_journey = Journey.new
	end

	def top_up(amount)
		message = "You cannot exceed the £#{MAXIMUM_LIMIT} limit!"
		raise (message) if max?(amount)
		@balance += amount
	end

  def touch_in(station)
    raise 'Insufficient money on your card!' if min?
    @new_journey.touch_in_record(station)
  end

  def touch_out(station)
    @new_journey.touch_out_record(station)
    @balance -= MINIMUM_LIMIT
  end

  private

  def min?
    @balance < MINIMUM_LIMIT
  end

  def max?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

end

