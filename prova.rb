require_relative './lib/risposte'
require_relative './lib/tutor'
require_relative './lib/argomenti'
require_relative './analisi_input.rb'

def prova_risposta(chiave)
  Argomenti.new(chiave).prendi_dati
end

def tutor(argomento)
  Tutor.per(argomento)
end
