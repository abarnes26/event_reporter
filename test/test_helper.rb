require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/clean'
require './lib/event_reporter'
require './lib/help'
require './lib/retrieve'
require 'pry'
