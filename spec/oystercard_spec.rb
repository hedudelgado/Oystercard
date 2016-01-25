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
		it 'raise an error when the top up is over the limit' do
		mes = "the amount exceed #{Oystercard::MAX_LIMIT}"
		expect{subject.top_up(Oystercard::MAX_LIMIT)}.to raise_error mes
		end
	end
	describe '#deduct' do 
		it 'reduces money from the oyster' do 
		subject.top_up(5)
		subject.deduct(5)
		expect(subject.balance).to eq 0
        end
    end
end