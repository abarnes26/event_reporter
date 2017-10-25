require_relative 'test_helper'

class EventReporterTest < Minitest::Test

  def test_it_instantiates
    report = EventReporter.new

    assert_instance_of EventReporter, report
  end

  def test_it_can_load_files_by_default
    report = EventReporter.new.load_command

    assert_output "You've just loaded 'full_event_attendees.csv'.", report
  end

  # def test_it_can_load_different_files
  #   report = EventReporter.new.load_command("sample.csv")
  #
  #   assert_instance_of Array, report
  # end

  # def test_the_find_command_works
  #   report = EventReporter.new
  #   report.load_command
  #   results = report.find_command("first_name", "Allison")[0]["first_Name"]
  #
  #   assert_equal "Allison", results
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
