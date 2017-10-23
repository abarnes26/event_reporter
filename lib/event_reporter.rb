require 'csv'
require './lib/retrieve'
# require 'readlines'

class EventReporter

def load(filename = "full_event_attendees.csv")
  CSV.open "#{filename}", headers: true, header_converters: :symbol
end

def get_user_input
  gets.chomp.split(" ")
end

def user_interaction
while input = Readline.readlines("@> ", true)
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
end

end
