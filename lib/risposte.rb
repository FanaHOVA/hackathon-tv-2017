require 'wikipedia'
module Risposte
  class Testuale
    def initialize(argomento)
      @argomento = argomento
    end

    def crea_descrizione
      "Salve #{@argomento}"
      #Argomenti.new(@argomento).to_s
    end
  end

  class Tutorial
    def initialize(argomento)
      @argomento = argomento #con @ la rendo 'globale' all'interno del file rb
    end

    def trova_link
      puts @argomento
      page = Wikipedia.find(@argomento, :prop => "info")
      page.fullurl
      #TODO trova link tutorial
    end
  end
end
