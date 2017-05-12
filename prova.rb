require_relative './lib/risposte'

def prova_risposta(argomento)
  Risposte::Tutorial.new(argomento).trova_link
end
