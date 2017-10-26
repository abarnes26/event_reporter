require_relative 'test_helper'

class HelpTest < Minitest::Test
  include Help

  def test_the_helper_gives_output
    assert_output  do help_directory end
  end

  def test_the_expanded_helper_gives_output_for_load
    assert_output do help_details_load end
  end

  def test_the_expanded_helper_gives_output_for_queue
    assert_output do help_details_queue end
  end

  def test_the_expanded_helper_gives_output_for_find
    assert_output do help_details_find end
  end

  def test_the_expanded_helper_gives_output_for_queue_clear
    assert_output do help_details_queue_clear end
  end

end
