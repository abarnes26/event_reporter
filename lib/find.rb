
class Find

 def retrieve_data(contents, column_name)
   contents.each do |column|
     output = column[:column_name]
     puts output 
   end
 end

# zipcode = clean_zipcodes(row[:zipcode])


  def clean_zipcodes(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def return_zipcodes

  end

end
