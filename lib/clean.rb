
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

  def clean_cities(row)
    if row["City"] == nil; row["City"] = "XXXX" end
  end

  def clean_states(row)
    if row["State"] == nil; row["State"] = "XX" end
  end

  def clean_streets(row)
    if row["Street"] == nil; row["Street"] = "XXXXX" end
  end

  def clean_all(row)
    row["Zipcode"] = clean_zipcodes(row["Zipcode"])
    row["HomePhone"] = clean_phone_numbers(row["HomePhone"])
    clean_streets(row)
    clean_cities(row)
    clean_states(row)
  end

end
