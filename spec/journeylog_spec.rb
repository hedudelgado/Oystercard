require 'journeylog.rb'

describe JourneyLog do 
	let(:station){double :station}

	describe '#start_journey' do 	
    	it 'will memorize the station where you start' do
      		subject.start_journey(station)
      		expect(subject.current).to include(:entry => station)
    	end
    end
    describe '#exit_journey' do 	
    	it 'will memorize the start and finish' do
      		subject.start_journey(station)
      		subject.exit_journey(station)
      		expect(subject.current).to include(:entry => station, :exit => station)
      	end
    end

    describe '#journeys' do 
    	it 'return the history' do 
    		subject.start_journey(station)
      		subject.exit_journey(station)
      		subject.start_journey(station)
      		subject.exit_journey(station)
      		expect(subject.journeys).to eq ["entry: #{station}","exit: #{station}","entry: #{station}","exit: #{station}"]
      	end  
    end
    # describe '#outstanding' do 
    # 	it 'close an incomplete journey and return its fare' do 
    # 		subject.start_journey(station)
    # 		expect(subject.start_journey(station)).to include(:exit => "incomplete journey, fare #{Journey::PENALTY_FARE} pounds.")
    # 	end
    # end

end			