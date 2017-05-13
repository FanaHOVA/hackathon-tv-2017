require 'wikipedia'
class Argomenti
  BASE = ['computer', 'stampante', 'scanner', 'internet']
  MEDIO = ['cicli for', 'condizionali', 'programmazione a oggetti']
  AVANZATO = ['gerarchie', 'metaprogrammazione', 'continuous integration']
  WEB = ['css', 'html', 'javascript', 'php', 'ruby']
  PROGRAMMAZIONE = ['ciclo for', 'ciclo while', 'struttura di controllo']
  RISPOSTE_PROGRAMMAZIONE = {
    'ciclo for' => "Il ciclo for determina l'esecuzione di una porzione di programma ripetuta per un certo numero noto di volte.\n
                    Può essere parafrasato in italiano come: per I che varia da 1 a N, stampa I.\n
                    FOR I=1 TO N\n
                      PRINT I\n
                    Puoi imparare di più su Codecademy: https://www.codecademy.com/courses/javascript-beginner-en-NhsaT/0/1",
    'ciclo while' => "Il ciclo while possono essere parafrasate come 'ripeti (il codice controllato) fintantoché resta vera la condizione C'.\n
                      Può essere parafrasato in italiano come: finchè I è minore di 10, stampa I e aumenta I di 1.\n
                      WHILE I < 10\n
                        PRINT I
                        I + 1\n
                      Puoi imparare di più su Codecademy: https://www.codecademy.com/courses/javascript-beginner-en-NhsaT/0/1"
  }

  def initialize(chiave)
    @chiave = chiave
  end

  def prendi_dati
    Wikipedia.Configure {
      domain 'it.wikipedia.org'
    }

    page = Wikipedia.find(@chiave, :prop => "info")
    text = page.text
    if Wikipedia.find(@chiave).summary.nil?
      "Scusami, questo argomento non mi compete... Unlucky :("
    else
      formatta_summary(Wikipedia.find(@chiave).summary) + "... Continua su #{page.fullurl}"
    end
  end

  def self.tutti
    BASE + MEDIO + AVANZATO + WEB
  end

  def formatta_summary(summary)
    return summary if summary.length < 640
    summary[0..620]
  end

  def self.programmazione(chiave)
    RISPOSTE_PROGRAMMAZIONE[chiave]
  end
end
