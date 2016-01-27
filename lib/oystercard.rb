class Card

MINIMUM_LIMIT = 1
MAXIMUM_LIMIT = 90

	attr_reader :balance, :limit

	def initialize
		@balance = 0
    @touch = false
	end

	def top_up(amount)
		message = "You cannot exceed the £#{MAXIMUM_LIMIT} limit!"
		raise (message) if max?(amount)
		@balance += amount
	end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'Insufficient money on your card!' if min?
    @touch = true
  end

  def touch_out
    @touch = false
  end

  def in_journey?
    @touch
  end

  private

  def min?
    @balance < MINIMUM_LIMIT
  end

  def max?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end

end

