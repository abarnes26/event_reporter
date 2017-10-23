require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/clean'
require 'pry'

class Clean_test < Minitest::Test
  include Clean

  def test_it_can_clean_zip_codes_that_are_too_short
    assert_equal "00123", clean_zipcodes("123")
  end

  def test_it_can_clean_zip_codes_that_are_too_long
    assert_equal "12345", clean_zipcodes("12345678")
  end

  def test_it_wont_change_valid_zipcodes
    assert_equal "12345", clean_zipcodes("12345")
  end

  def test_it_can_clean_phone_numbers_that_are_too_short
    assert_equal "0001231234", clean_phone_numbers("1231234")
  end

  def test_it_can_clean_phone_numbers_that_are_too_long
    assert_equal "1231231234", clean_phone_numbers("12312312345678")
  end

  def test_it_wont_change_valid_phone_numbers
    assert_equal "1231231234", clean_phone_numbers("1231231234")
  end

  def test_it_can_change_phone_format
    assert_equal "12345", remove_phone_formatting("(12) 3.4-5")
  end

  def test_it_does_not_care_about_the_format_of_phone_numbers
    assert_equal "1231231234", clean_phone_numbers("(123) 123-1234")
  end

  def test_it_can_clean_formats_and_lengths
    assert_equal "0000121234", clean_phone_numbers("1.2 -(123) 4")
  end

end
