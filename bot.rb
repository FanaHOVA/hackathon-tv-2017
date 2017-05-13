require 'facebook/messenger'
require_relative './lib/messaggi'
require_relative './lib/argomenti'
require_relative './lib/risposte'
require_relative './lib/tutor'
require_relative './analisi_input'

include Facebook::Messenger

Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  text = message.text

  if array_to_regexp(Messaggi::DOMANDE) =~ text
    rispondi_con(AnalisiInput.domande(text), message)
  elsif /tutorial/i =~ text
    rispondi_con(AnalisiInput.tutorial(text), message)
  elsif /serve un tutor/i =~ text
    rispondi_con(AnalisiInput.tutor(text), message)
  elsif /implementazioni/i =~ text
    rispondi_con(AnalisiInput.implementazioni, message)
  else
    rispondi_con_immagine('https://media.tenor.co/images/fc6941bd311eb000cae7833fd3c71480/tenor.gif', message)
  end
end

def rispondi_con(messaggio, message)
  message.reply(text: messaggio)
end

def rispondi_con_immagine(url_img, message)
  message.reply(
    attachment: {
      type: 'image',
      payload: {
        url: url_img
      }
    }
  )
end

def array_to_regexp(array, catch_data = false)
  return Regexp.new(array.join('|')) unless catch_data
  Regexp.new("(#{array.join('|')})")
end
