require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/retrieve'
require 'csv'
require 'pry'

class Retrieve_test < Minitest::Test

  def test_it_can_format_headers
    results = Retrieve.new.format_header("cItY")

    assert_equal "City", results
  end

  # def test_it_can_parse_rows
  #   find = Retrieve.new
  #   contents = CSV.open "full_event_attendees.csv", headers: true
  # end

  def test_it_can_find_registration_dates_with_messy_header
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true

    assert_equal "11/12/08 10:47", find.retrieve_data(contents, "reGdate", "11/12/08 10:47")[0]["RegDate"]
  end

  def test_it_can_clean_zip_codes
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true
    find.retrieve_data(contents, "first_name", "Colin")

    assert_equal "02703", find.queue[0]["Zipcode"]
  end

  def test_it_can_clean_phone_numbers
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true
    find.retrieve_data(contents, "first_name", "Audrey")

    assert_equal "5309193000", find.queue[0]["HomePhone"]
  end

  def test_it_can_find_first_names
    find = Retrieve.new
    contents = CSV.open "full_event_attendees.csv", headers: true

    assert_equal "Allison", find.retrieve_data(contents, "first_name", "Allison")[0]["first_Name"]
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

end
