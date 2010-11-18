require 'rubygems'
require 'open-uri'
require 'json'

default_voice = 'en'
voices = { :es => { :lang => 'Spanish', :name => 'Carmen'   },
           :de => { :lang => 'German',  :name => 'Katrin'   },
           :it => { :lang => 'Italian', :name => 'Paola'    },
           :nl => { :lang => 'Dutch',   :name => 'Saskia'   },
           :fr => { :lang => 'French',  :name => 'Florence' },
           :pl => { :lang => 'Polish',  :name => 'zosia' } }

text = 'Krakow is such a beautiful city!'
translate_uri = "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=#{text}"

answer
 
sleep 2
say text, :voice => 'allison'

voices.each do |voice|
  url = URI.encode(translate_uri + "&langpair=#{default_voice}|#{voice[0].to_s}")
  translation = JSON.parse(open(url).read)
  say "Now in #{voice[1][:lang]}", :voice => 'allison'
  log translation.inspect
  if translation['responseData']['translatedText']
    say translation['responseData']['translatedText'], :voice => voice[1][:name]
  end
end

say 'Thanks for listening! Goodbye.', :voice => 'allison'
hangup