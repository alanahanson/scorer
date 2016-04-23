require_relative "scorer/version"
require_relative "scorer/request_constructor"
require_relative "scorer/score"

require 'open-uri'
require 'json'

module Scorer

  def self.get_score(options={})
    url = RequestConstructor.new(options).url
    file = open(url)
    response_data = JSON.parse(file.read)
    Score.new(response_data["propensity"], response_data["ranking"])
  end
  
end


