require 'journey'

describe Journey do
	let(:station){double :station}

	it'has a journey class' do  	
		expect(subject).to be_a Journey 
	end


	let(:journey){ {entry_station: station, exit_station: station} }  
  let(:oystercard){double :oystercard}	
  	describe '#journey_history' do 
  		it 'has a journey history'do
    		expect(subject.journey_history).to be_empty
  		end
  		it 'stores a journey' do
    		subject.touch_in2(station) 
    		subject.touch_out2(station)
    		expect(subject.journey_history).to include journey 
    	end
	end

	describe '#journey_history' do 
  		it 'the card forgets the station' do
      		subject.touch_in2(station)
      		subject.touch_out2(station)
      		expect(subject.entry_station).to eq nil
    	end
    end
    
    describe '#entry_station' do 	
    	it 'will memorize the station where you get in' do
      		subject.touch_in2(station)
      		expect(subject.entry_station).to eq station
    	end
    end

    describe '#fare' do
    	it 'return the min fare' do 
        subject.touch_in2(station)
        subject.touch_out2(station)
    		expect(subject.fare).to eq OysterCard::MIN_BALANCE
    	end

      it 'shows the penalty' do 
        allow(oystercard).to receive(:balance) {6}
        subject.touch_in2(station)
        subject.touch_in2(station)
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end

      it'shows penalty when touch out twice' do
        subject.touch_out2(station)
        expect(subject.fare).to eq Journey::PENALTY_FARE 
      end
    end
end









