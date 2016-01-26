class OysterCard

    MIN_BALANCE = 1
  	MAX_BALANCE = 90
	  attr_reader :balance, :entry_station, :journey_history

	  def initialize
    	@balance = 0
      @journey_history = {}
  	end

  	def top_up(value)
    	raise "Amount exceeds the limit: #{MAX_BALANCE}" if @balance +value > MAX_BALANCE
    	@balance += value
  	end

    def touch_in(station)
      raise 'not enough funds' if MIN_BALANCE > @balance
      @entry_station = station
    end

    def touch_out(station)
      @journey_history[:entry_station] =  @entry_station #journey_history takes [:entry_station] as a key and @entry_station as a value.
      @journey_history[:exit_station]  =  station #journey_history takes [:entry_station] as a key and @entry_station as a value. 
      #the result is {entry_station: station, exit_station: station}, becuaase the hash pushed a key and a value as it was one unic element 
      #(like everything you push into the array, but the index is 0 becuase the index is actually the key)

#it will obviously overwrite the has everytime as it has the same key
#but passes the test and the chapter so far only says to store once! hahaha
# 2.2.3 :006 > oyster.touch_in('hola')
#  => "hola" 
# 2.2.3 :007 > oyster.touch_out('adios')
#  => nil 
# 2.2.3 :008 > oyster.journey_history
#  => {:entry_station=>"hola", :exit_station=>"adios"} 
# 2.2.3 :009 > oyster.touch_in('hello')
#  => "hello" 
# 2.2.3 :010 > oyster.touch_out('bye')
#  => nil 
# 2.2.3 :011 > oyster.journey_history
#  => {:entry_station=>"hello", :exit_station=>"bye"} 

      deduct(MIN_BALANCE)
      @entry_station = nil
    end

    def in_journey?
      !!@entry_station
    end

private

    def deduct(value)
  		@balance -= value
  		return value
  	end
end
