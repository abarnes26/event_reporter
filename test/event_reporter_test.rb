require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'
require 'pry'
require 'simplecov'

class EventReporterTest < Minitest::Test

  def test_it_instantiates
   report = EventReporter.new

   assert_instance_of EventReporter, report
  end

  def test_it_can_load_files_by_default
    report = EventReporter.new.load

    assert_instance_of CSV, report
  end

  def test_it_can_load_different_files
    report = EventReporter.new.load("sample.csv")

    assert_instance_of CSV, report
  end

 end
