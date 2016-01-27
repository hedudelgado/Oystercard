class Card

MINIMUM_LIMIT = 1
MAXIMUM_LIMIT = 90

	attr_reader :balance, :journey_history

	def initialize
		@balance = 0
    @journey_history = []
    @current_journey = {}
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
    @current_journey[:entry_station] = station
  end

  def touch_out(station)
    @current_journey[:exit_station] = station
    save
    reset
    @balance -= MINIMUM_LIMIT
  end

  def in_journey?
    @current_journey != {}
  end

  private

  def save
    @journey_history << @current_journey
  end

  def reset
    @current_journey = {}
  end

  def min?
    @balance < MINIMUM_LIMIT
  end

  def max?(amount)
    @balance + amount > MAXIMUM_LIMIT
  end


end

