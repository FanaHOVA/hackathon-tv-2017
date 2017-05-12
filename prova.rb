require_relative './lib/risposte'
require_relative './lib/tutor'
require_relative './lib/argomenti'

def prova_risposta(chiave)
  Argomenti.new(chiave).prendi_dati
end

def tutor(argomento)
  Tutor.per(argomento)
end

puts prova_risposta('enrico carboni')
puts prova_risposta('carbonara')
