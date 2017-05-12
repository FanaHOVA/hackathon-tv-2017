require_relative './lib/risposte'
require_relative './lib/tutor'

def prova_risposta(argomento)
  Risposte::Tutorial.new(argomento).trova_link
end

def tutor(argomento)
  Tutor.per(argomento)
end
