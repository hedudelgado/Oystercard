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

    describe'#journey?' do
        it 'should return false at first as the oyster' do
        expect(subject.journey?).to eq false
        end
    end

    describe '#touch_in' do 
        it 'should change the journey status of the oyster card to true' do
        subject.top_up(5) 
        subject.touch_in
        expect(subject.journey?).to eq true
        end
          it 'raise an error when the oyster has less than 1 pound founds' do 
        expect{subject.touch_in}.to raise_error 'not enough founds, need to top up'
        end
    end

      describe '#touch_out' do 
        it 'should change the journey status of the oyster card to false' do
        subject.top_up(5)  
        subject.touch_in
        subject.touch_out
        expect(subject.journey?).to eq false
        end
          it 'should change the journey status of the oyster card to false' do
        subject.top_up(5)  
        subject.touch_in
        expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MIN)
        end
    end
   
end