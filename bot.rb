require 'facebook/messenger'
require_relative './lib/messaggi'
require_relative './lib/argomenti'

include Facebook::Messenger

Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  text = message.text

  if array_to_regexp(Messaggi::DOMANDE) =~ text
    data = text.match(array_to_regexp(Argomenti::BASE))
    crea_risposte(data) unless data
    "Non abbiamo trovato nulla, mi dispiace! :("
  elsif /tutorial/i =~ text
    data = text.match(/cerco tutorial su (\D*)/)
    link = Risposte::Tutorial.new(data.first).trova_link
    "Ti abbiamo trovato un tutorial! Vai su #{link}"
  elsif /something humans like/i =~ text
    message.reply(
      text: 'Hello, human!',
      quick_replies: [
        {
          content_type: 'text',
          title: 'Hello, bot!',
          payload: 'HELLO_BOT'
        }
      ]
    )
    message.reply(
      text: 'I found something humans seem to like:'
    )

    message.reply(
      attachment: {
        type: 'image',
        payload: {
          url: 'https://i.imgur.com/iMKrDQc.gif'
        }
      }
    )

    message.reply(
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: 'Did human like it?',
          buttons: [
            { type: 'postback', title: 'Yes', payload: 'HUMAN_LIKED' },
            { type: 'postback', title: 'No', payload: 'HUMAN_DISLIKED' }
          ]
        }
      }
    )
  else
    message.reply(
      text: 'You are now marked for extermination.'
    )

    message.reply(
      text: 'Have a nice day.'
    )
  end
end

Bot.on :postback do |postback|
  case postback.payload
  when 'HUMAN_LIKED'
    text = 'That makes bot happy!'
  when 'HUMAN_DISLIKED'
    text = 'Oh.'
  end

  postback.reply(
    text: text
  )
end

Bot.on :delivery do |delivery|
  puts "Delivered message(s) #{delivery.ids}"
end

def array_to_regexp(array)
  Regexp.new(array.join('|'))
end

def crea_risposte(argomenti)
  argomenti.each do |argomento|
    Risposte::Testuale.new(argomento)
  end
end
