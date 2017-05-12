require 'facebook/messenger'
require_relative './lib/messaggi'
require_relative './lib/argomenti'
require_relative './lib/risposte'
include Facebook::Messenger

Bot.on :message do |message|
  puts "Received '#{message.inspect}' from #{message.sender}"
  text = message.text

  if array_to_regexp(Messaggi::DOMANDE) =~ text
    data = text.match(array_to_regexp(Argomenti::BASE, true))
    unless data.nil?
      rispondi_con("#{Risposte::Testuale.new(data[1]).crea_descrizione}", message)
      chiedi_feedback(message)
    else
      rispondi_con("Non abbiamo trovato nulla su #{data}, mi dispiace! :(", message)
    end
  elsif /tutorial/i =~ text
    data = text.match(/tutorial \b\w*\b (.*)/)
    if data
      link = Risposte::Tutorial.new(data[1]).trova_link
      rispondi_con("Ti abbiamo trovato un tutorial! Vai su #{link}", message)
      chiedi_feedback(message)
    else
      rispondi_con("Nessun tutorial trovato su #{data} :(", message)
    end
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

def array_to_regexp(array, catch_data = false)
  return Regexp.new(array.join('|')) unless catch_data
  Regexp.new("(#{array.join('|')})")
end

def chiedi_feedback(message)
  message.reply(
    attachment: {
      type: 'template',
      payload: {
        template_type: 'button',
        text: 'Ti è stato utile?',
        buttons: [
          { type: 'postback', title: 'Si', payload: 'HUMAN_LIKED' },
          { type: 'postback', title: 'No', payload: 'HUMAN_DISLIKED' }
        ]
      }
    }
  )
end

def rispondi_con(messaggio, message)
  message.reply(text: messaggio)
end
