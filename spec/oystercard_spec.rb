
require "OysterCard"
describe OysterCard do
  
  let(:station){double :station}
  
  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end


  describe "#top_up"do
    it "tops up the card is empty"do
      subject.top_up(65)
      expect(subject.balance).to eq 65
    end
    it "tops up the card when the card has money"do
      subject.top_up(10)
      subject.top_up(20)
      expect(subject.balance).to eq 30
    end
    it "has a maximum balance"do
      expect{ subject.top_up(OysterCard::MAX_BALANCE + 1) }.to raise_error "Amount exceeds the limit: #{OysterCard::MAX_BALANCE}"
    end
  end

  describe '#touch_in'do

    it 'error when  oyster doesnt a minimum balance' do
      expect{subject.touch_in(station)}.to raise_error 'not enough funds'
    end


  end


    it 'deducts fare from balance'do
      subject.top_up(OysterCard::MIN_BALANCE)
      subject.touch_in(station)
      expect{subject.touch_out(station)}.to change{subject.balance}.by -OysterCard::MIN_BALANCE
    end
  

    # it "its charging right" do
    #   subject.top_up(10)
    #   subject.touch_in(station)
    #   subject.touch_out(station)
    #   expect(subject.balance).to eq 0
    # end
  end 



