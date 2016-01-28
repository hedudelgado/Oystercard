class Journey 

  MINIMUM_LIMIT = 1
  MAXIMUM_LIMIT = 90

  attr_reader :journey_history, :card

  def initialize
    @journey_history = {}
  end

  def touch_in_record(station)
    @journey_history[:station] = station
    penalty_in
    elaine
  end

  def touch_out_record(station)
    penalty_out
    edu
    @journey_history[:station] = station
  end

  def fare
    if @penalty == true then 6 else MINIMUM_LIMIT end
  end

private

  def elaine
    @entry = true
    @exit = false
  end
  
  def edu
    @entry= false
    @exit = true
  end
  
  def penalty_in
    if @entry == false and @exit  == true then @penalty = false else @penalty = true end
  end
  
  def penalty_out
    if @entry == true and @exit  == false then @penalty = false else @penalty = true end
  end

end

