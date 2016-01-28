require 'journey'

RSpec.describe Journey do

	subject(:journey) {described_class.new} 
	let(:station) {double(:station)}

	it 'creates a new journey' do
	  expect(Journey.new).to be_a(Journey)
	end

	context 'record journeys' do

		it 'starts with empty journey history' do
		expect(subject.journey_history).to be_empty
		end

		it 'saves current_journey to history when touch out' do
		journeys = {:station => station, :station => station}  #make sure you change journey to something else to avoid confusion with double, which you've called journey!
		journey.touch_in_record(station)
		journey.touch_out_record(station)
		expect(subject.journey_history).to eq journeys
		end
	end

	context 'fares' do

		it 'touch in and touch out, pay minimum #fare' do 
		journey.touch_in_record(station)
		journey.touch_out_record(station)
		expect(subject.fare).to eq Journey::MINIMUM_LIMIT
		end

		it 'touch in and don\'t touch out, pay penalty' do 
		journey.touch_in_record(station)
		expect(subject.fare).to eq 6
		end
	end

		it 'don\'t touch in and touch out, pay penalty' do
		journey.touch_out_record(station)
		expect(subject.fare).to eq 6
	end

end
