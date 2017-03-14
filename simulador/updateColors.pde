final byte planta[][] = {
  {8}, 
  {15, 9}, 
  {0}, 
  {7, 1}, 
  {14, 6, 16, 2, 10}, 
  {5, 3}, 
  {4}, 
  {13, 11}, 
  {12}
};

final int dist = 200;
final int jump = 5;

int to = 0;
int from = 0;
boolean zeroCross;

color[] colorArray = new color[17];

void updateColors() {
  color[] palette = new color[planta.length]; // matriz auxiliar

  to += jump;
  if (to > maxHSB) {
    to = to - maxHSB;
  }

  from = to - dist;
  if (from < 0) {
    from = maxHSB + from;
  }

  //pcor.setValue(to);
  //scor.setValue(from);

  if (from > to) {
    zeroCross = true;
  } else {
    zeroCross = false;
  }

  for (int i = 0; i < palette.length; ++i) {
    if (zeroCross) {
      int h = int(from+(maxHSB+to-from)*i/float(palette.length));
      if (h > maxHSB) {
        h = h - maxHSB;
      }
      palette[i] = color(h, maxHSB, maxHSB);
    } else {
      int h = int(from+(to-from)*i/float(palette.length));
      palette[i] = color(h, maxHSB, maxHSB);
    }
    for (int j = 0; j < planta[i].length; j++) {
      colorArray[planta[i][j]] = palette[i];
    }
  }

  sendColors(colorArray);
}

void sendColors(color[] cores) {

  for (int i = 0; i < cores.length; ++i) {
    if (i < 8) { // interno
      for (int j = 0; j < jardim.size(); ++j) { // todos os jardins
        jardim.get(j).controlador[0].cor[i] = cores[i];
      }
    } else if (i < 16) { // externo
      for (int j = 0; j < jardim.size(); ++j) { // todos os jardins
        jardim.get(j).controlador[1].cor[i-8] = cores[i];
      }
    } else { // central
      for (int j = 0; j < cmaster.cor.length; ++j) {
        cmaster.cor[j] = cores[i];
      }
    }
  }
}