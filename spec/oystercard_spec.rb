require 'oystercard'

RSpec.describe Card do

limit = Card::MAXIMUM_LIMIT
subject(:card) {described_class.new}  #enables you to replace subject with card (still creating new instance but easier to read)

	it 'creates a new card' do
		expect(Card.new).to be_a(Card)
	end

	context 'balance' do

		it 'has a balance of zero' do
		expect(card.balance).to eq(0)
		end
	end

	context 'top ups' do

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'tops up the balance' do
		expect{card.top_up(1)}.to change{ card.balance }.by(1)
		end

	end

	context 'maximum limit' do

		it "cannot exceed #{limit}" do
		message = "You cannot exceed the £#{limit} limit!"
		card.top_up(limit)  # the value needs to be less than the limit less what is topped up in test (so if default value = 90, and you top up 1 or more, you need value of 89 or less)
		expect{card.top_up(1)}.to raise_error(message)
		end
	end

  context 'deducts' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts from balance' do
    expect{card.deduct(1)}.to change{ card.balance }.by(-1)
    end

  end

  context 'card in use' do

    it {is_expected.to respond_to(:touch_in)}
    it {is_expected.to respond_to(:touch_out)}
    it {is_expected.to respond_to(:in_journey?)}

    it 'it is not in a journey ?' do
    expect(card.in_journey?).to eq false
    end

  end

  context 'topped up' do

    it 'needs to be topped up' do
    card.top_up(limit)
    end

    it 'can touch in' do
   	card.top_up(limit)
    card.touch_in
    expect(card).to be_in_journey
    end

    it 'can only touch in with a minimum balance of £1' do
    expect{card.touch_in}.to raise_error 'Insufficient money on your card!' 
	end

    it 'can touch out' do
    card.top_up(limit)
    card.touch_in
    card.touch_out
    expect(card).not_to be_in_journey
    end

  end

end






