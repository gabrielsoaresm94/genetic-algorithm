class DNA {
  float[] genes; //genotipo
  int tamGenes = 17; //tamGenotipo
  float fitness;
 
  DNA() {
    genes = new float[tamGenes];
    for (int i=0;i<genes.length;i++) {
      genes[i] = random(0,1);
    }   
  }
  
  /*void fitness() {
    //fit = total de carac. corretos / total de caract.
    //fit = 10 / 18;
    int score = 0;
    for (int i=0; i<genes.length; i++) {
      if (genes[i] == tamGenes) {
        score++;
      }
    }
    fitness = float(score)/tamGenes; //2^target.length()
  }*/

  DNA crossover(DNA outroPai) {
    DNA filho = new DNA();

    int corte = int(random(genes.length));
    for (int i=0; i<genes.length; i++) {
      if (i<corte) {
        filho.genes[i] = genes[i];
      } else {
        filho.genes[i] = outroPai.genes[i];
      }
    }
    return filho;
  }

  void mutar(float taxaMutacao) {
    for (int i=0; i<genes.length; i++) {
      if (random(1) < taxaMutacao) {
        genes[i] = (float) random(0,1);
      }
    }
  }
  
}
