class Populacao {
  float taxaMutacao;
  Smile[] populacao;
  int geracoes;
  ArrayList<Smile> pool;

  Populacao(float mut, int tam) {
    taxaMutacao = mut;
    populacao = new Smile[tam];
    pool = new ArrayList<Smile>();
    geracoes = 0;

    for (int i=0; i<populacao.length; i++) {
      populacao[i] = new Smile(new DNA());
    }
  }

  void selecao() {
    float maxFitness = getMaxFitness();
    pool.clear();

    for (int i=0; i<populacao.length; i++) {
      float normalFitness = map(populacao[i].getFitness(), 0, maxFitness, 0, 1);
      int qtd = (int)normalFitness*100;
      for (int j=0; j<qtd; j++) {
        pool.add(populacao[i]);
      }
    }
  }

  void reproducao() {
    for (int i=0; i<populacao.length; i++) {
      int posA = int(random(pool.size()));
      int posB = int(random(pool.size()));

      Smile paiA = pool.get(posA);
      Smile paiB = pool.get(posB);

      DNA filho = paiA.dna.crossover(paiB.dna);
      filho.mutar(taxaMutacao);
      populacao[i] = new Smile(filho);
    }
    geracoes++;
  }


  float getMaxFitness() {
    float max = 0;
    for (int i=0; i<populacao.length; i++) {
      if (populacao[i].getFitness()>max) {
        max = populacao[i].getFitness();
      }
    }
    return max;
  }

  void mostraTodoMundo() {
    for (int i=0; i<populacao.length; i++) {
      populacao[i].displayFenotipo(50+i*75, 60, i);
    }
    fill(0);
    text("Geração: " + geracoes , width/2, 10);
  }
}
