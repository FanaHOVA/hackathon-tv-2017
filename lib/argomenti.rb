class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    #TODO trova info
  end

  def to_s
    "Queste sono le informazioni: #{prendi_dati}"
  end

  def self.tutti
    BASE + MEDIO + AVANZATO
  end
end
