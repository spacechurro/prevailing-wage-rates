require 'sinatra'
require 'padrino-helpers'
load 'wage_description.rb'

register Padrino::Helpers

wage_description = WageDescription.new

get '/' do
  erb(:form, :locals => {:wage_description => wage_description})
end

post '/' do
  search_result = wage_description.search(params[:county], params[:labor_type])
  erb(:display, :locals => {:search_result => search_result})
end
