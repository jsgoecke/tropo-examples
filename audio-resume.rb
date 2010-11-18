answer
say "Welcome to John Doe's audio resumay.", :voice => 'kate'

listening = true
while listening
  result = ask "Please press 1 to hear an overview of John's resumay, please press 2 to listen to his most recent experience or press 3 to connect to John and hire him!", 
               { :repeat => 3, :choices => '1, 2, 3', :onBadChoice => lambda { say 'Invalid entry, please try again.', :voice => 'kate' }, :voice => 'kate' }

  case result.value
  when '1'
    say 'John is adept at managing all aspects of information technology, including ongoing business needs assessment, software development and implementation.', :voice => 'kate'
    sleep 2
  when '2'
    say 'John served as the I T Director at ABC Insurance. John is a direct manager of a team of 6 people chared with delivery of enterpirse level projects.', :voice => 'kate'
    sleep 2
  when '3'
    transfer 'tel:+14157044517'
  else
    say 'Thank you for your time, goodbye.', :voice => 'kate'
    listening = false
  end
end

hangup