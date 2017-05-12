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
      Wikipedia.Configure {
        domain 'it.wikipedia.org'
      }
      puts @argomento
      page = Wikipedia.find(@argomento, :prop => "info")
      text = page.text
      if   Wikipedia.find(@argomento).text.nil? 
        "Scusami, questo argomento non mi compete... Unlucky :("
      else
        page.fullurl
      end 
      #TODO trova link tutorial
    end
  end
end