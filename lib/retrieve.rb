require './lib/clean'

class Retrieve

  attr_reader :queue

  def initialize
    @queue = []
  end

 def retrieve_data(contents, column_name, criteria)
   column_name = format_header(column_name)
   parse_rows(contents, column_name, criteria)
   @queue
 end

 def parse_rows(contents, column_name, criteria)
   contents.map do |row|
       next if row[column_name].downcase != criteria.downcase
       @queue << row.to_h
    end
 end


 def header_list
   {"regdate" => "RegDate",
    "first_name" => "first_Name",
    "last_name" => "last_Name",
    "email_address" => "Email_Address",
    "homephone" => "HomePhone",
    "street" => "street",
    "city" => "City",
    "state" => "State",
    "zipcode" => "Zipcode"
  }
 end

 def format_header(header)
     header_list[header.downcase]
 end

 def queue_count
   @queue.count
 end

 def queue_clear
   @queue = []
 end

end
