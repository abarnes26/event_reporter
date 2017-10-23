require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/find'
require 'csv'
require 'pry'

class Find_test < Minitest::Test

  def test_it_can_find_registration_dates
    find = Find.new
    contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol

    find.retrieve_data(contents, "RegDate")
  end

  def test_it_can_find_first_names
    skip
    find = Find.new
    contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol

    assert_equal "Allison",
 end
end
