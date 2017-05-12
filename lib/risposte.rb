require 'wikipedia'
module Risposte
  class Testuale
    def initialize(argomento)
      @argomento = argomento
    end

    def crea_descrizione
      Argomenti.new(@argomento)
    end
  end

  class Tutorial
    def initialize(argomento)
      @argomento = argomento # con @ la rendo 'globale' all'interno del file rb
    end

    def trova_link
      page = Wikipedia.find(@argomento, :prop => "info")
      page.fullurl
    end
  end
end
