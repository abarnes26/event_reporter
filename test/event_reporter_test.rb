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
    report = EventReporter.new.load_command

    assert_instance_of CSV, report
  end

  def test_it_can_load_different_files
    report = EventReporter.new.load_command("sample.csv")

    assert_instance_of CSV, report
  end

  def test_the_find_command_works
    report = EventReporter.new
    report.load_command
    results = {" "=>"1",
              "RegDate"=>"11/12/08 10:47",
               "first_Name"=>"Allison",
               "last_Name"=>"Nguyen",
               "Email_Address"=>"arannon@jumpstartlab.com",
               "HomePhone"=>"6154385000",
               "Street"=>"3155 19th St NW",
               "City"=>"Washington",
               "State"=>"DC",
               "Zipcode"=>"20010"}

    assert_equal "Allison", report.find_command("first_name", "Allison")[0]["first_Name"]
  end

  def test_the_queue_command_works
    report = EventReporter.new
    report.load_command
    report.find_command("first_name", "John")

    assert_equal 63, report.queue_command("count")

    report.queue_command("clear")

    assert_equal 0, report.queue_command("count")

  end

 end
