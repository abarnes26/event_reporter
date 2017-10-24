
module Clean

  def clean_zipcodes(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_numbers(phone_number)
    remove_phone_formatting(phone_number).to_s.rjust(10, "0")[0..9]
  end

  def remove_phone_formatting(phone_number)
    phone_number.delete "(" ")" "-" "." " "
  end

end
