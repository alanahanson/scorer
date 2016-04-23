require 'spec_helper'
require 'scorer/score'

describe Scorer::Score do
  let(:score) {Scorer::Score.new(99, "A")}

  context "upon initialization" do 
    it "is a Score object" do
      p score
      expect(score.class).to eq(Scorer::Score)
    end

    it "has a propensity" do 
      expect(score.propensity).to eq(99)
    end

    it "has a ranking" do 
      expect(score.ranking).to eq("A")
    end
  end
end