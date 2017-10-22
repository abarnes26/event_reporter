
class Find

#RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode


 def retrieve_registration_date(contents)
   conents.each do |row|
     reg_date = row{:RegDate}
     puts retrieve_registration_date
   end
 end

  def retrieve_first_name(contents)
    contents.each do |row|
      first_name = row[:first_name]
      puts first_name
    end
  end

  def retrieve_last_name(contents)
    contents.each do |row|
      last_name = row[:last_name]
      puts last_name
    end
  end

  def retireve_email_address(contents
    contents.each do |row|
    email_address = row[:Email_Address]
    puts email_address
  end
end


HomePhone,Street,City,State,Zipcode

zipcode = clean_zipcodes(row[:zipcode])


  def clean_zipcodes(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def return_zipcodes
  end

end
