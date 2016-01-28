require 'station'

RSpec.describe Station do

	# it 'creates a new station' do
	#   # expect(Station.new).to be_a(Station)
	# end

	subject{described_class.new(name:'Bond Street', zone: 1)}

		it 'knows its station\'s name' do
		expect(subject.name).to eq('Bond Street')
		end

		it 'knows its station\'s zone' do
		expect(subject.zone).to eq(1)
		end
end  