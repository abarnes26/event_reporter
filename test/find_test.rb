require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/find'
require 'csv'
require 'pry'

class Find_test < Minitest::Test

  def test_it_can_find_registration_dates
    skip
    find = Find.new
    contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol

    assert_equal "11/12/08",find.retrieve_data(contents, "RegDate")[0]
  end

  def test_it_can_find_first_names
    find = Find.new
    contents = CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol

    assert_equal "Allison", find.retrieve_data(contents, :first_Name)
 end
end
