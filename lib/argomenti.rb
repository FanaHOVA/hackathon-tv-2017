require 'wikipedia'
class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    puts @chiave
    page = Wikipedia.find(@chiave, :prop => "info")
    text = page.text
    puts page.summary
    if   Wikipedia.find(@chiave).text.nil? 
      "Scusami, questo argomento non mi compete... Unlucky :("
    else
      Wikipedia.find(@chiave).summary  
    end 
  end

  def to_s
    "Queste sono le informazioni: #{prendi_dati}"
  end
end