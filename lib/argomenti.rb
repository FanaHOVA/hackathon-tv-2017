require 'wikipedia'
class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']
  WEB = ['css', 'html', 'javascript', 'php', 'ruby']
  PROGRAMMAZIONE = ['ciclo for', 'ciclo while']

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    Wikipedia.Configure {
      domain 'it.wikipedia.org'
    }

    page = Wikipedia.find(@chiave, :prop => "info")
    text = page.text
    if Wikipedia.find(@chiave).summary.nil?
      "Scusami, questo argomento non mi compete... Unlucky :("
    else
    formatta_summary(Wikipedia.find(@chiave).summary)
    end
  end

  def self.tutti
    BASE + MEDIO + AVANZATO + WEB + PROGRAMMAZIONE
  end

  def formatta_summary(summary)
    return summary if summary.length < 640
    summary[0..639]
  end
end
