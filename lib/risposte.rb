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
      @argomento = argomento #con @ la rendo 'globale' all'interno del file rb
    end

    def trova_link
      Wikipedia.Configure {
        domain 'it.wikipedia.org'
      }
      puts @argomento
      page = Wikipedia.find(@argomento, :prop => "info")
      text = page.text
      if   Wikipedia.find(@argomento).text.nil? 
        "Scusami, questo argomento non mi compete... Unlucky :("
      else
        "Ti abbiamo trovato un tutorial! Vai su #{link}" + page.fullurl
      end 
    end
  end
end