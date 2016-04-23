require 'spec_helper'
require "scorer/score"


describe Scorer do
  it 'has a version number' do
    expect(Scorer::VERSION).not_to be nil
  end

  it "returns a Score object" do
    data = '{"propensity": 0.26532, "ranking": "C"}'
    file = double
    allow(Scorer).to receive(:open).and_return(file)
    allow(file).to receive(:read).and_return(data)
    scorer = Scorer.get_score(age: 12, income: 30294.21, zipcode: '53916')
    expect(scorer).to be_a(Scorer::Score)
    expect(scorer.propensity).to eq(0.26532)
    expect(scorer.ranking).to eq("C")
  end
end
