require './lib/clean'

class Retrieve
  include Clean

  attr_reader :queue

  def initialize
    @queue = []
    @file_contents = []
  end

  def load_file(filename = "full_event_attendees.csv")
    @file_contents.clear
    loaded_file = CSV.open filename, headers: true
    loaded_file.map do |row|
      row["Zipcode"] = clean_zipcodes(row["Zipcode"])
      row["HomePhone"] = clean_phone_numbers(row["HomePhone"])
      if row["Street"] == nil; row["Street"] = "XXXXX" end
      if row["City"] == nil; row["City"] = "XXXX" end
      if row["State"] == nil; row["State"] = "XX" end
      @file_contents << row
    end
  end

  def retrieve_data(column_name, criteria)
    queue_clear
    column_name = format_header(column_name)
    parse_rows(column_name, criteria)
  end

  def parse_rows(column_name, criteria)
    @file_contents.map do |row|
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
    @queue.clear
  end

end
