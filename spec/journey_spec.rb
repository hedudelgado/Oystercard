require 'journey'

RSpec.describe Journey do

	subject(:journey) {described_class.new} 
	let(:station) {double(:station)}

	it 'creates a new journey' do
	  expect(Journey.new).to be_a(Journey)
	end

	context 'record journeys' do

		it 'starts with empty journey history' do
		expect(subject.journey_history).to eq []
		end

		it 'saves current_journey to history when touch out' do
		journeys = {:station => station, :station => station}  #make sure you change journey to something else to avoid confusion with double, which you've called journey!
		journey.touch_in_record(station)
		journey.touch_out_record(station)
		expect(subject.journey_history).to eq [journeys]
		end
	end
end