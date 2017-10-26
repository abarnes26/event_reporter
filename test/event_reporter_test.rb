require_relative 'test_helper'

class EventReporterTest < Minitest::Test

  def test_it_instantiates
    report = EventReporter.new

    assert_instance_of EventReporter, report
  end

  def test_it_can_load_files_by_default
    assert_output "You've just loaded full_event_attendees.csv.\n" do EventReporter.new.load_command end
  end

  def test_it_can_load_different_files
    assert_output "You've just loaded sample.csv.\n" do EventReporter.new.load_command("sample.csv") end
  end

  # def test_the_find_command_works
  #   report = EventReporter.new
  #
  #   assert_output
  #   "You've just loaded full_event_attendees.csv.
  #   The results for Allison under first_name have been added to the queue\n"
  #   do report.load_command report.find_command("first_name", "Allison") end
  # end

  # def test_the_queue_command_works
  #   report = EventReporter.new
  #   report.load_command
  #   report.find_command("first_name", "John")
  #
  #   assert_equal 63, report.queue_command("count")
  #
  #   report.queue_command("clear")
  #
  #   assert_equal 0, report.queue_command("count")
  # end
end
