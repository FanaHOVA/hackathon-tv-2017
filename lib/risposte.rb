module Risposte
  class Testuale
    def initialize(argomento)
      @argomento = argomento
    end

    def crea_descrizione
      Argomenti.new(@argomento)}.to_s
    end
  end

  class Tutorial
    def initialize(argomento)
      @argomento = argomento
    end

    def trova_link
      #TODO trova link tutorial
    end
  end
end
