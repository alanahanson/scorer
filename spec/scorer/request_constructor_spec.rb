require 'spec_helper'
require 'scorer/request_constructor'

describe Scorer::RequestConstructor do

  context "upon initialization" do 
    it "is a RequestConstructor object" do
      request = Scorer::RequestConstructor.new
      expect(request.class).to eq(Scorer::RequestConstructor)
    end
  end

  context "when given valid arguments" do 
    it "returns a url when given three search parameters" do 
      request = Scorer::RequestConstructor.new(income: 68500, age: 28, zipcode: "90210")
      expect(request.url).to eq("http://not_real.com/customer_scoring?income=68500&zipcode=90210&age=28")
    end

    it "returns a url when given two search parameters" do 
      request = Scorer::RequestConstructor.new(age: 28, zipcode: "90210")
      expect(request.url).to eq("http://not_real.com/customer_scoring?zipcode=90210&age=28")
    end

    it "returns a url when given only the income parameter" do 
      request = Scorer::RequestConstructor.new(income: 68500)
      expect(request.url).to eq("http://not_real.com/customer_scoring?income=68500")
    end

    it "returns a url when given only the zipcode parameter" do 
      request = Scorer::RequestConstructor.new(zipcode: "90210")
      expect(request.url).to eq("http://not_real.com/customer_scoring?zipcode=90210")
    end

    it "returns a url when given only the age parameter" do 
      request = Scorer::RequestConstructor.new(age: 28)
      expect(request.url).to eq("http://not_real.com/customer_scoring?age=28")
    end
  end

  context "when given no arguments" do
    it "raises an exception when zero arguments are passed" do
      request = Scorer::RequestConstructor.new
      expect {request.url}.to raise_error("Must provide at least one search parameter.")
    end
  end

  context "when given invalid argument for income" do
    it "raises an exception when income is not a number" do
      request = Scorer::RequestConstructor.new(income: true, age: 28, zipcode: "90210")
      expect {request.url}.to raise_error("Income must be a number greater than or equal to zero.")
    end

    it "raises an exception when income is a negative number" do
      request = Scorer::RequestConstructor.new(income: -12000, age: 28, zipcode: "90210")
      expect {request.url}.to raise_error("Income must be a number greater than or equal to zero.")
    end

    it "does not raise an exception for a positive integer" do
      request = Scorer::RequestConstructor.new(income: 35000, age: 28, zipcode: "90210")
      expect {request.url}.not_to raise_error
    end

    it "does not raise an exception for a positive float" do
      request = Scorer::RequestConstructor.new(income: 121.23, age: 28, zipcode: "90210")
      expect {request.url}.not_to raise_error
    end
  end

  context "when given invalid argument for zipcode" do
    it "raises an exception when zipcode is not a string" do
      request = Scorer::RequestConstructor.new(income: 35000, age: 19, zipcode: 20394)
      expect {request.url}.to raise_error("Zipcode must be a string of 5 or 9 digits (e.g. '60626' or '606181217.")
    end

    it "raises an exception when zipcode contains non-digit characters" do
      request = Scorer::RequestConstructor.new(income: 35000, age: 19, zipcode: "2ab94")
      expect {request.url}.to raise_error("Zipcode must be a string of 5 or 9 digits (e.g. '60626' or '606181217.")
    end

    it "raises an exception when zipcode does not consist of exactly five or nine digits" do
      request = Scorer::RequestConstructor.new(income: 35000, age: 19, zipcode: "1020394")
      expect {request.url}.to raise_error("Zipcode must be a string of 5 or 9 digits (e.g. '60626' or '606181217.")
    end

    it "does not raise an exception for 5-digit zipcode" do
      request = Scorer::RequestConstructor.new(income: 121.23, age: 28, zipcode: "00124")
      expect {request.url}.not_to raise_error
    end

    it "does not raise an exception for a 9-digit zipcode" do
      request = Scorer::RequestConstructor.new(income: 121.23, age: 28, zipcode: "001249924")
      expect {request.url}.not_to raise_error
    end
  end

  context "when given invalid argument for age" do
    it "raises an exception when age is not a number" do
      request = Scorer::RequestConstructor.new(income: 100, age: "thirty-seven", zipcode: '20394')
      expect {request.url}.to raise_error("Age must be an integer greater than or equal to zero.")
    end

    it "raises an exception when age is not an integer" do
      request = Scorer::RequestConstructor.new(income: 100, age: 37.5, zipcode: '20394')
      expect {request.url}.to raise_error("Age must be an integer greater than or equal to zero.")
    end

    it "raises an exception when age is not a positive number" do
      request = Scorer::RequestConstructor.new(income: 100, age: -5, zipcode: '20394')
      expect {request.url}.to raise_error("Age must be an integer greater than or equal to zero.")
    end

    it "does not raise an exception for a positive integer" do
      request = Scorer::RequestConstructor.new(income: 100, age: 999, zipcode: '20394')
      expect {request.url}.not_to raise_error
    end
  end
end