class Journey 

  attr_reader :journey_history  #inst var

  def initialize
    @journey_history = []
    @current_journey = {}

  end

  def touch_in_record(station)
    @current_journey[:station] = station
  end

  def touch_out_record(station)
    @current_journey[:station] = station
    save
    reset
  end

  private

  def save
    @journey_history << @current_journey
  end

  def reset
    @current_journey = {}
  end

  # def in_journey?
  #   @current_journey != {}
  # end

end