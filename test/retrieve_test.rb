require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/retrieve'
require 'csv'
require 'pry'

class Retrieve_test < Minitest::Test

  def test_it_can_clean_headers
    results = Retrieve.new.clean_header("cItY")

    assert_equal "City", results
  end

  def test_it_can_find_registration_dates_with_messy_header
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true

    assert_equal "11/12/08 10:47",find.retrieve_data(contents, "reGdAtE")[0]
  end

  def test_it_can_find_first_names
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true

    assert_equal "Allison", find.retrieve_data(contents, "first_name")[0]
 end

 def test_it_can_find_specific_names
   contents = CSV.open "full_event_attendees.csv", headers: true
   results = Retrieve.new
   results.retrieve_data(contents, "first_name", "John")

   assert_equal 63, results.queue_count
 end

 def test_it_can_clear_the_queue
   contents = CSV.open "full_event_attendees.csv", headers: true
   results = Retrieve.new
   results.retrieve_data(contents, "first_name", "john")

   assert_equal 63, results.queue_count

   results.queue_clear

   assert_equal 0, results.queue_count
 end

 def test_it_can_return_results_with_details
   skip
   contents = CSV.open "full_event_attendees.csv", headers: true
   results = Retrieve.new
   results.retrieve_data(contents, "first_name", "John")

   assert_equal "21,11/28/08 22:44,John,Hoy,xhnebenz@jumpstartlab.com,5126732000,300 E 30th St Apt 304,Austin,TX,78705", results.queue.first
 end

end
