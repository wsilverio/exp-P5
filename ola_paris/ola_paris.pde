float[][] ponto = new float[80][2];
void setup() {
  size(600, 200);

  for (int i = 0; i < ponto.length; i++) {
    ponto[i][0] = random(width);
    ponto[i][1] = random(height);
  }

  stroke(#FF8181);
}
void draw() {
  background(255);
  for (int i = 0; i < ponto.length; i++) {
    ponto[i][0] += random(-1, 1);
    ponto[i][1] += random(-1, 1);

    ponto[i][0] = constrain(ponto[i][0], 0, width);
    ponto[i][1] = constrain(ponto[i][1], 0, height);

    for (int x = i; x >= 0; x--) {
      if (dist(ponto[i][0], ponto[i][1], ponto[x][0], ponto[x][1]) <= 75) line(ponto[i][0], ponto[i][1], ponto[x][0], ponto[x][1]);
    }
  }
}
