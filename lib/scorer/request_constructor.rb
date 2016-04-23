module Scorer
  class RequestConstructor

    def initialize(options = {})
      @income = options[:income]
      @zipcode = options[:zipcode]
      @age = options[:age]
      @base_url = "http://not_real.com/customer_scoring"
    end

    def url
      raise Exception.new("Must provide at least one search parameter.") unless search_parameters
      "#{base_url}?#{search_parameters}"
    end

    private

    attr_reader :income, :age, :zipcode, :base_url

    def search_parameters
      query = [income_param, zipcode_param, age_param].reject { |param| param == nil }
      if query.empty?
        nil
      else
        query.join("&") 
      end
    end

    def income_param
      if income == nil
        nil
      elsif income_valid?
        "income=#{income}"
      else
        raise Exception.new("Income must be a number greater than or equal to zero.")
      end
    end

    def income_valid?
      income.is_a?(Numeric) && income >= 0
    end

    def zipcode_param
      if zipcode == nil
        nil
      elsif zipcode_valid?
        "zipcode=#{zipcode}"
      else
        raise Exception.new("Zipcode must be a string of 5 or 9 digits (e.g. '60626' or '606181217.")
      end
    end

    def zipcode_valid?
      !!(zipcode =~ /\A\d{5}\z/) || !!(zipcode =~ /\A\d{9}\z/)
    end

    def age_param
      if age == nil
        nil
      elsif age_valid?
        "age=#{@age}"
      else
        raise Exception.new("Age must be an integer greater than or equal to zero.")
      end
    end

    def age_valid?
      age.is_a?(Integer) && age >= 0
    end 

  end  
end

