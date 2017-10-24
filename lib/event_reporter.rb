require 'csv'
require './lib/retrieve'
require 'readline'
require 'pry'

class EventReporter

  def initialize
    @retriever = Retrieve.new
  end

def get_user_input
  gets.chomp.split(" ")
end

def process_input
  input = get_user_input
  until input == ["exit"]
   case input[0]
    when "load"
      load_command(input[1])
    when "find"
      find_command(input[1], input[2].strip)
    when "queue"
      queue_command(input[1])
    when "help"
      help_command(input[1..-1])
    end
   end
 end

 def load_command(filename = "full_event_attendees.csv")
   @loaded_file = CSV.open filename, headers: true
 end

 def find_command(column, criteria)
   @retriever.retrieve_data(@loaded_file, column, criteria)
   @retriever.queue
 end

 def queue_command(action)
     case action
      when "count"
       @retriever.queue_count
      when "clear"
       @retriever.queue_clear
     end
   end


# def user_interaction
# while inputs = Readline.readline("@> ", true)
#   input = inputs.split(" ")
#   case input
#   when
#     load
#   when
#     @retreiver.retrieve_data(@loaded_file, input[1], input[2])
#   when "queue" && input[1] == "count"
#     puts @retreiver.queue_count
#   when "exit"
#     break
#   end
#  end
# end

end
