class Tutor
  DISPONIBILI = ['html', 'css', 'c', 'node']
  TUTORS = { 'html' => ['Alessio', 'Manuel'],
             'css' => ['Andrea', 'Federico'],
             'node' => ['Andrea', 'Alessio'],
             'c' => ['Andrea', 'Alessio'] }

  def self.per(argomento)
    "Ci sono #{TUTORS[argomento].length} tutor per #{argomento}: #{TUTORS[argomento].join(', ')}"
  end
end
