module Scorer
  class Score
    attr_reader :ranking
    
    def initialize(propensity, ranking)
      @propensity = propensity
      @ranking = ranking
    end

    def propensity
      @propensity + 2
    end
  end
end