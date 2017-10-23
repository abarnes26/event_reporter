
class Find

 def retrieve_data(contents, column_name)
   contents.map do |column|
     column[column_name]
   end
 end

# zipcode = clean_zipcodes(row[:zipcode])

end
