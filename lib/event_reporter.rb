require './lib/retrieve'
require './lib/help'
require 'pry'
require 'csv'

#must export HTML
#must build all tests

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
        when "quit"
          break
        else
          error_message
      end
    end
  end

  def load_command(file = nil)
    if file == nil
      puts "You've just loaded full_event_attendees.csv."
      @retriever.load_file
    else
      puts "You've just loaded #{file}."
      @retriever.load_file(file)
    end
  end

  def find_command(column, criteria)
    @retriever.retrieve_data(column, criteria.to_s)
    puts "The results for #{criteria} under #{column} have been added to the queue"
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
          print_queue(@retriever.queue)
        else
          error_message
      end
    else
      case action[0..1]
        when ["print", "by"]
          print_queue(sort_queue(action[2]))
        when ["save", "to"]
          save_queue_to_file(action[2])
        when ["export", "html"]
          export_to_hmtl
        else
          error_message
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

  def print_queue(queue)
    format = space_formatting
    puts format % header_formatting
    queue.each do |criteria|
      puts format % data_formatting(criteria)
    end
  end

  def save_queue_to_file(filename)
    CSV.open(filename, "wb") do |file|
      file << csv_header_formatting
      @retriever.queue.each do |row|
        file << row.values
      end
    end
  end

  def export_to_hmtl
    export_data = @retriever.queue
    html = EventReporter::XmlMarkup.new(:indent => 5)
    html.table {
    html.tr { export_data[0].keys.each { |key| html.th(key)}}
    export_data.each { |row| html.tr { row.values.each { |value| html.td(value)}}}
    }
    puts "#{html}"
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

  def csv_header_formatting
    [" ","RegDate","first_Name","last_Name",
    "Email_Address","HomePhone","Street",
    "City","State","Zipcode"]
  end

end
