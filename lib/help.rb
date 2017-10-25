
module Help

  def help_directory
     help_details
  end

  #help queue print
  #program isn't treating "Salt Lake City" as one arguement
  #program isn't finding state DC
  #need to complete HTML export
  #program cannot find by states
  #clean cities
  #clean states
  #clean streets

 def expanded_help_details(input)
    case input[1..-1]
    when ["load"]
      help_details_load
    when ["queue"]
      help_details_queue
    when ["find"]
      help_details_find
    when ["queue", "clear"]
      help_details_queue_clear
    when ["queue", "count"]
      help_details_queue_count
    when ["queue", "print"]
      help_details_queue_print
    when ["queue", "print", "by"]
      queue_details_print_by
    when ["queue", "save", "to"]
      queue_details_save_to
    end
  end



  def help_details
    puts "Event Reporter is here to make sorting your data easy!
     Use the following commands to get started -
       'load <filename>'
       'queue <option>'
       'find <attribute> <criteria>'
       'exit'

       Try typing a 'help' followed by a specific command to see
       what it will do!"
  end

  def help_details_queue
    puts "The 'queue' command on it's own won't produce any results.
    Try adding in other key words like 'queue count', or queue print'."
  end

  def help_details_load
    puts "Use 'load' to import a local csv file for analyzing.  Don't
    worry, we've got one for you didn't bring your own!"
  end

  def help_details_queue_count
      puts "Use the 'queue count' function to find out how many entries
      you've got in your current queue.

      NOTE: The queue will be emptied before each search query."
  end

  def help_details_queue_clear
      puts "Use the 'queue clear' function to empty your current queue."
  end

  def help_details_queue_print
      puts "Use the 'queue print' function to display all of your current
      entries in the queue.

      NOTE: The queue will only be populated with your most recent search."
  end

  def queue_details_print_by
      puts "Use the 'queue print by <attribute>' function to print your
      data to the screen sorted by the attribute of your choice."
  end

  def queue_details_save_to
      puts "Use the 'queue save to <filename.csv>' function to export your
      current queue to a file of your choosing.

      WARNING: Exporting will overwrite the current contents of any existing file."
  end

  def help_details_find
    puts "Use the 'find <attribute> <criteria>' to retrieve data from the
    currently loaded file and move it into your queue.

    Here are a few examples to get you started -

    'find zipcode 20011'
    'find first_name Audrey'
    'find state NC'

    NOTE: Your queue will be cleared at the beginning of each new search."
  end

end
