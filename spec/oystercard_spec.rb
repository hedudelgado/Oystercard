require "make_oystercard.rb"
describe OysterCard do

  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end
  it "gets topped up "do
    subject.top_up(65)
    expect(subject.balance).to eq 65
  end
end
