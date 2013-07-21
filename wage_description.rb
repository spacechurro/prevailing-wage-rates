require 'open-uri'
require 'json'

class WageDescription
  attr_reader :wage_descriptions, :counties, :labor_types

  def initialize
    @wage_descriptions = JSON.parse(File.read('rates.json'))
    @counties = wage_descriptions.map { |line| line['county'] }.uniq.sort
    @labor_types = wage_descriptions.map { |line| line['labor_type'] }.uniq.sort
  end

  def search(county, labor_type)
    wage_descriptions.find do |line| 
      line['labor_type'] == labor_type && line['county'] == county
    end
  end
end
