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

color[] colorArray = new color[3*17];

void updateColors() {
  color[] palette = new color[3*planta.length]; // matriz auxiliar

  to += jump;
  if (to > maxHSB) {
    to = to - maxHSB;
  }

  from = to - dist;
  if (from < 0) {
    from = maxHSB + from;
  }

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
  }

  for (int i = 0; i < planta.length; ++i) { // esta na paleta
    for (int j = 0; j < planta[i].length; j++) { // leds na mesma cor
      for (int k = 0; k < 3; ++k) { // jardim especifico
        colorArray[planta[i][j]+k*17] = palette[i+k*planta.length];
      }
    }
  }

  sendColors(colorArray);
}

void sendColors(color[] cores) {

  for (int i = cores.length-1; i >= 0; --i) {
    if (i == 50) {
      cmaster.cor[2] = cores[i];
    } else if (i == 33) {
      cmaster.cor[1] = cores[i];
    } else if (i == 16) {
      cmaster.cor[0] = cores[i];
    } else if (i >= 42) {
      jardim.get(2).controlador[1].cor[i-42] = cores[i];
    } else if (i >= 34) {
      jardim.get(2).controlador[0].cor[i-34] = cores[i];
    } else if (i >= 25) {
      jardim.get(1).controlador[1].cor[i-25] = cores[i];
    } else if (i >= 17) {
      jardim.get(1).controlador[0].cor[i-17] = cores[i];
    } else if (i >= 8) {
      jardim.get(0).controlador[1].cor[i-8] = cores[i];
    } else {
      jardim.get(0).controlador[0].cor[i] = cores[i];
    }
  }
}