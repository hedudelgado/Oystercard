require 'journeylog.rb'

describe JourneyLog do 
	let(:station){double :station}

  describe '#start_journey' do 
    it 'should start a new journey with an entry station' do 
      subject.start_journey(station)
      expect(subject.current).to eq ({entry_station: station})
    end
  end
 

  describe '#journeys' do 
    it '#journeys should return a list of all previous journeys' do 
      cheat = [{entry_station: station, exit_station: station},{entry_station: station, exit_station: station}]
      subject.start_journey(station)
      subject.exit_station(station)
      subject.start_journey(station)
      subject.exit_station(station)
      expect(subject.journeys).to eq cheat
    end
    it 'should add a new exit station to the current_journey' do 
      subject.start_journey(station)
      subject.exit_station(station)
      expect(subject.journeys).to eq([{entry_station: station, exit_station: station}])
    end
  end

    describe '#outstanding_charges' do
      it 'should close an incomplete journey and return its fare' do 
        journey = [{entry_station: station, trip: nil}]
        subject.start_journey(station)
        subject.start_journey(station)
        expect(subject.journeys).to eq journey
      end
      it 'should close an incomplete 2nd case' do 
        journey = [{entry_station: station, exit_station: station},{trip: nil, exit_station: station}]
        subject.start_journey(station)
        subject.exit_station(station)
        subject.exit_station(station)
        expect(subject.journeys).to eq journey
      end
       it 'should close an incomplete 2nd case' do 
        journey = [{entry_station: station, exit_station: station},{entry_station: station, trip: nil }]
        subject.start_journey(station)
        subject.exit_station(station)
        subject.start_journey(station)
        subject.start_journey(station)
        expect(subject.journeys).to eq journey
      end
    end
end

