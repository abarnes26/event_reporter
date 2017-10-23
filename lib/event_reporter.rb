require 'csv'
require 'readlines'

class EventReporter

def get_user_input
  user_input = gets.chomp.split(" ")
end

def load(filename = full_event_attendees.csv)
  CSV.open "#{filename}", headers: true, header_converters: :symbol
end

input = get_user_input
while input = Readline.readlines("> ", true)
  case input
  when "find"
  when "exit"
    break
  when "load"
    load
  when "find"
    find
end

end
