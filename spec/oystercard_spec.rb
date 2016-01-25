require 'oystercard'

describe Oystercard do
	describe 'balance' do 
    	it 'should return a balance' do
    	expect(subject.balance).to eq 0
		end
    end
    describe '#top_up' do 
		it 'should be able to add money and increase the balance' do 
		subject.top_up(5)
		expect(subject.balance).to eq 5	
		end
	end
end