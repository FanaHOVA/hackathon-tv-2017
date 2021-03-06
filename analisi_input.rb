require_relative './lib/argomenti'
require_relative './lib/tutor'
require_relative './lib/risposte'
require_relative './lib/messaggi'
require 'httparty'


class AnalisiInput
  def self.domande(text)
    data = text.match(array_to_regexp(Argomenti.tutti, true))
    unless data.nil?
      "#{Risposte::Testuale.new(data[1]).crea_descrizione}"
    else
      "Non abbiamo trovato nulla su #{data}, mi dispiace! :("
    end
  end

  def self.implementazioni()
    "-Riconoscimento e Riproduzione Vocale 
    -Miglioramento Algoritmi di Matching dei contenuti
    -Ampliamento della Base di Conoscenza dei contenuti 
    -Implementazione Natural Language Processing delle stringhe"
  end

  def self.tutorial(text)
    "Non abbiamo trovato un tutorial specifico, ma Salvatore può aiutarti! Vai su https://www.aranzulla.it/?s=#{slug(text)}"
  end

  def self.tutor(text)
    data = text.match(array_to_regexp(Tutor::DISPONIBILI, true))
    if data
      Tutor.per(data[1])
    else
      "Non abbiamo trovato tutor per il tuo argomento :("
    end
  end

  def self.programmazione(text)
    Argomenti.programmazione(text)
  end
end

def array_to_regexp(array, catch_data = false)
  return Regexp.new(array.join('|')) unless catch_data
  Regexp.new("(#{array.join('|')})")
end

def slug(text)
  text.split(' ').join('+')
end
