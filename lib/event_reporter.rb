require 'csv'
require './lib/retrieve'
require 'readline'
require 'pry'
require './lib/help'

#must export HTML
#must add return statement for nil entries

class EventReporter
  include Help

  def initialize
    @retriever = Retrieve.new
  end

  def get_input
    gets.chomp.split(" ")
  end

  def process_input
    puts "Welcome to Event Reporter!"
    puts "What would you like to do? (try 'help' for a list of commands)"
    loop do
      input = get_input
      case input[0]
        when "load"
          load_command(input[1])
        when "find"
          find_command(input[1], input[2..-1].join(" "))
        when "queue"
          queue_command(input[1..-1])
        when "help"
          help_command(input[0..-1])
        when "exit"
          break
      end
    end
  end

  def load_command(file = nil)
    if file == nil
      puts "You've just loaded 'full_event_attendees.csv'."
      @retriever.load_file
    else
      puts "You've just loaded #{file}."
      @retriever.load_file(file)
    end
  end

  def find_command(column, criteria)
    @retriever.retrieve_data(column, criteria.to_s)
    puts "The results for #{criteria} under #{column} have been added to the queue"
    @retriever.queue
  end

  def queue_command(action)
    if action.length == 1
      case action
        when ["count"]
          puts "Your queue has #{@retriever.queue_count} attendees in it!"
        when ["clear"]
          puts "Your queue is now empty."
          @retriever.queue_clear
        when ["print"]
          print_queue
      end
    else
      case action[0..1]
        when ["print", "by"]
          print_sorted_queue(action[2])
        when ["save", "to"]
          save_queue_to_file(action[2])
      end
    end
  end

  def help_command(input)
    if input.length == 1
      help_directory
    else
      expanded_help_details(input)
    end
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

  def save_queue_to_file(filename)
    CSV.open(filename, "w") do |file|
      format = space_formatting
      @retriever.queue.each do |row|
        file << row
      end
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

end
