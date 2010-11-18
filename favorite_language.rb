answer
sleep 2

say 'Welcome to the conference!', :voice => 'allison'

result = ask 'What is your favorite programming language?', 
             { :choices => 'dynamically(jruby, ruby, python, groovy), statically(c, java)',
               :repeat => 3,
               :voice  => 'allison' }

say "So you like #{result.value} typed languages like #{result.choice.utterance} do you?", :voice => 'allison'

sleep 1

say 'Enjoy the rest of the conference!', :voice => 'allison'
hangup