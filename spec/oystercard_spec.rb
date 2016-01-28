require 'oystercard'

RSpec.describe Card do

limit = Journey::MAXIMUM_LIMIT
subject(:card) {described_class.new}  #enables you to replace subject with card (still creating new instance but easier to read)
let(:entry_station) {double(:station)}
let(:exit_station) {double(:station)}


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

# context 'deducts' do

#   it { is_expected.to respond_to(:deduct).with(1).argument }

#   it 'deducts from balance' do
#     expect{card.deduct(1)}.to change{ card.balance }.by(-1)
#   end

# end



context 'topped up' do

  it 'needs to be topped up' do
    card.top_up(limit)
  end

  it 'can touch in' do
    expect{card.touch_in(entry_station)}.to raise_error 'Insufficient money on your card!'
  end

  it 'can only touch in with a minimum balance of £1' do
    expect{card.touch_in(entry_station)}.to raise_error 'Insufficient money on your card!'
  end

  context '#touch_out' do

    before do
      card.top_up(limit)
      card.touch_in(entry_station)
    end

   it 'charges minimum fare at touch_out' do
     expect{card.touch_out(exit_station)}.to change{card.balance}.by (-(Journey::MINIMUM_LIMIT))
   end
 end
end
end







