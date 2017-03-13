

byte planta[][] = {
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

color[] colorArray = new color[17];

int pcolor = 0;
int scolor = 0;
int dist = 200;
int jump = 0;

boolean zeroCross;

void updateColors() {
  color[] palette = new color[planta.length]; // matriz auxiliar

  pcolor += jump;
  if (pcolor > maxHSB) {
    pcolor = pcolor - maxHSB;
  }

  scolor = pcolor - dist;
  if (scolor < 0) {
    scolor = maxHSB + scolor;
  }

  scolor = constrain(scolor, 0, maxHSB);

  pcor.setValue(pcolor);
  scor.setValue(scolor);

  if (scolor > pcolor) {
    zeroCross = true;
  } else {
    zeroCross = false;
  }

  color from = color(scolor, maxHSB, maxHSB);
  color to = color(pcolor, maxHSB, maxHSB);

  for (int i = 0; i < palette.length; ++i) {
    //if (zeroCross) {
    //palette[i] = lerpColor(to, from, i/float(palette.length-1));
    //} else {
    palette[i] = lerpColor(from, to, i/float(palette.length-1));
    //}
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