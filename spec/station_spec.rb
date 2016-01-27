require 'station'
	
	describe Station do 
    	subject {described_class.new(name: "Old Street", zone: 1)}
    	it 'knows the name' do 
    		expect(subject.name).to eq("Old Street")
    	end
    	it 'knows the zone' do 
    		expect(subject.zone).to eq(1)
    	end
  	end
