$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'numeritaj_tipo'
require 'pry'
require 'pry-byebug'
require 'tapp'

require './spec/support/enums/payment_status.rb'

Dir['./spec/support/**/*.rb', './spec/shared_examples/**/*.rb'].each {|f| require f }
