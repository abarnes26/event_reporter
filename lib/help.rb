
module Help

  def help(message)
    case message
      when "help"
       help_details
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

  def help_details_load
    puts "Use 'load' to import a local csv file for analyzing.  Don't
    worry, we've got one for you didn't bring your own!"
  end

  def help_details_queue(options)
    case options
    when "count"
      puts "Use the 'queue count' function to find out how many entries
      you've got in your current queue.

      NOTE: The queue will be emptied before each search query."
    when "clear"
      puts "Use the 'queue clear' function to empty your current queue."
    when "print"
      puts "Use the 'queue print' function to display all of your current
      entries in the queue.

      NOTE: The queue will only be populated with your most recent search."
    when "print by"
      puts "Use the 'queue print by <attribute>' function to print your
      data to the screen sorted by the attribute of your choice."
    when "save to"
      puts "Use the 'queue save to <filename.csv>' function to export your
      current queue to a file of your choosing.

      WARNING: Exporting will overwrite the current contents of any existing file."

    end




end
