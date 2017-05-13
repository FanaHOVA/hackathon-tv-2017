require 'wikipedia'
class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  WEB = ['css', 'html', 'javascript', 'php', 'ruby']
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    Wikipedia.Configure {
      domain 'it.wikipedia.org'
    }
    puts @chiave
    page = Wikipedia.find(@chiave, :prop => "info")
    text = page.text
    puts page.summary
    if   Wikipedia.find(@chiave).text.nil?
      "Scusami, questo argomento non mi compete... Unlucky :("
    else
    "Ti abbiamo trovato un tutorial! \n" + Wikipedia.find(@chiave).summary
    end
  end

  def to_s
    "Abbiamo qualche info su #{@chiave}! #{prendi_dati}"
  end

  def self.tutti
    BASE + MEDIO + AVANZATO + WEB
  end
end
