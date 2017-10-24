require './lib/event_reporter'

report = EventReporter.new

report.load_command

report.find_command("first_name", "John")

report.queue_command("count")

report.save_queue_to_file("sample_export.csv")
