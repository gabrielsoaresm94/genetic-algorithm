Populacao pop;

void setup() {
  size(800, 200);
  frameRate(30);
  pop = new Populacao (0.05, 10);
}

void draw() {
  background(255);
  pop.mostraTodoMundo();
}

void mousePressed() {
  pop.selecao();
  pop.reproducao();
}
