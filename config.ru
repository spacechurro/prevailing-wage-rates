require 'rubygems'
require 'bundler'

Bundler.require

require './prev_wage.rb'

run Sinatra::Application
