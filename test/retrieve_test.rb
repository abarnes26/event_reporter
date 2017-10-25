require_relative 'test_helper'

class Retrieve_test < Minitest::Test

  def test_it_can_format_headers
    results = Retrieve.new.format_header("cItY")

    assert_equal "City", results
  end

  def test_it_can_find_registration_dates_with_messy_header
    find = Retrieve.new
    find.load_file
    find.retrieve_data("reGdate", "11/12/08 10:47")


    assert_equal "11/12/08 10:47", find.queue[0]["RegDate"]
  end

  def test_it_can_clean_zip_codes
    find = Retrieve.new
    find.load_file
    find.retrieve_data("first_name", "Colin")

    assert_equal "02703", find.queue[0]["Zipcode"]
  end

  def test_it_can_clean_phone_numbers
    find = Retrieve.new
    find.load_file
    find.retrieve_data("first_name", "Audrey")

    assert_equal "5309193000", find.queue[0]["HomePhone"]
  end

  def test_it_can_find_first_names
    find = Retrieve.new
    find.load_file
    find.retrieve_data("first_name", "Allison")

    assert_equal "Allison", find.queue[0]["first_Name"]
  end

  def test_it_can_find_specific_names
    retrieve = Retrieve.new
    retrieve.load_file
    retrieve.retrieve_data("first_name", "John")

    assert_equal 63, retrieve.queue_count
  end

  def test_it_can_clear_the_queue
    retrieve = Retrieve.new
    retrieve.load_file
    retrieve.retrieve_data("first_name", "john")

    assert_equal 63, retrieve.queue_count

    retrieve.queue_clear

    assert_equal 0, retrieve.queue_count
  end

end
