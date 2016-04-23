module Scorer
  class Score
    attr_reader :propensity, :ranking
    
    def initialize(propensity, ranking)
      @propensity = propensity
      @ranking = ranking
    end
  end
end