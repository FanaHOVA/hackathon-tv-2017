class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  RIS_BASE = { 'computer' => 'Il computer è un calcolatore!',
               'stampante' => 'La stampante stampa!',
               'scanner' => 'Lo scanner copia le foto!' }
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    RIS_BASE[@chiave]
  end

  def to_s
    "Queste sono le informazioni: #{prendi_dati}"
  end

  def self.tutti
    BASE + MEDIO + AVANZATO
  end
end
