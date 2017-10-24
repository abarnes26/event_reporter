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
    puts "What would you like to do? (try 'Help' for a list of commands)"
    until input == ["exit"]
      case input[0]
        when "load"
         load_command(input[1])
        when "find"
         find_command(input[1], input[2].strip)
        when "queue"
         queue_command(input[1..-1]
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
  #  action
    case action
      when "count"
       return @retriever.queue_count
      when "clear"
       @retriever.queue_clear
      when "print"
       print_command
    end
  end

  def help_command

  end

  def print_command(criteria = nil)

  end

  def print_queue
    format = space_formatting
    puts format % header_formatting
    @retriever.queue.each do |criteria|
      next if criteria == nil
      puts format % data_formatting(criteria)
    end
  end

 def print_sorted_queue(attribute)
     format = space_formatting
     puts format % header_formatting
     sorted_queue = sort_queue(attribute)
     sorted_queue.each do |criteria|
        next if criteria == nil
        puts format % data_formatting(criteria)
     end
 end

 def sort_queue(attribute)
   attribute = @retriever.format_header(attribute)
   @retriever.queue.sort_by { |row| row[attribute.to_s]}
 end

 def space_formatting
   '%-13s %-13s %-45s %-7s %-25s %10s %-35s %-13s'
 end

 def header_formatting
   ['LAST NAME', 'FIRST NAME', 'EMAIL','ZIPCODE',
   'CITY', 'STATE', 'ADDRESS', 'PHONE']
 end

 def data_formatting(criteria)
   [criteria["last_Name"], criteria["first_Name"],
    criteria["Email_Address"], criteria["Zipcode"],
    criteria["City"], criteria["State"],
    criteria["Street"], criteria["HomePhone"]]
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
