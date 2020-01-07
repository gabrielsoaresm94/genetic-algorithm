/*SMILE*/

import java.awt.Rectangle;

class Smile {
  DNA dna;
  float fitness;
  Rectangle rec;

  Smile() {
    rec = new Rectangle(0, 0, 0, 0);
    fitness = 0.1;
  }

  Smile(DNA dna) {
    this();
    this.dna = dna;
  }

  float getFitness() {
    return fitness;
  }

  void displayFenotipo(int x, int y, int num) {
    float size = map(dna.genes[0], 0, 1, 0, 70);
    color corCabeca = color(dna.genes[1]*255, dna.genes[2]*255, dna.genes[3]*255);
    float eyeSize = map(dna.genes[4], 0, 1, 0, 10);
    color corOlho = color(dna.genes[5]*255, dna.genes[6]*255, dna.genes[7]*255);
    float larguraBoca = map(dna.genes[8], 0, 1, 0, 50);
    float altBoca = map(dna.genes[9], 0, 1, 0, 50);
    color corBoca = color(dna.genes[10]*255, dna.genes[11]*255, dna.genes[12]*255);
    float olhoX = map(dna.genes[13], 0, 1, 0, 10);
    float olhoY = map(dna.genes[13], 0, 1, 0, 5);
    float bocaX = map(dna.genes[15], 0, 1, -25, 25);
    float bocaY = map(dna.genes[16], 0, 1, 0, 25);

    rec = new Rectangle(x-35, y-35, 70, 70);

    noFill();
    stroke(0.25);
    rect(x, y, 70, 70);

    pushMatrix();
    translate(x, y);
    noStroke();

    fill(0);
    textAlign(CENTER);
    text(num, 0, 50);    
    text(fitness, 0, 65);

    fill(corCabeca);
    ellipseMode(CENTER);
    ellipse(0, 0, size, size);

    fill(corOlho);
    rectMode(CENTER);
    rect(-olhoX, -olhoY, eyeSize, eyeSize);
    rect(olhoX, -olhoY, eyeSize, eyeSize);

    fill(corBoca);
    rect(bocaX, bocaY, larguraBoca, altBoca);

    popMatrix();
    if (rec.contains(mouseX, mouseY)) {
      fitness+=0.033;
    }
  }
}
