//import controlP5.*;
//ControlP5 cp5;
//Slider pcor;
//Slider scor;

final int diam = 350;
final float dmini = 0.025*diam;
final int delayms = 100;
final int maxHSB = 255;

Controlador cmaster;
ArrayList<Jardim> jardim = new ArrayList<Jardim>();

void setup() {
  size(1200, 600);
  noStroke();
  colorMode(HSB, maxHSB);
  frameRate = 999;

  //cp5 = new ControlP5(this);
  //pcor = cp5.addSlider("to")
  //  .setPosition(50, height-70)
  //  .setSize(width-100, 20)
  //  .setRange(0, maxHSB)
  //  ;
  //scor = cp5.addSlider("from")
  //  .setPosition(50, height-40)
  //  .setSize(width-100, 20)
  //  .setRange(0, maxHSB)
  //  ;

  to = dist;

  cmaster = new Controlador(true, 3);

  for (int i = 0; i < 3; ++i) {
    jardim.add(new Jardim((i+0.5)*width/3f, height/2f, diam));
  }
}

void draw() {
  background(255);

  if (isTime()) {
    updateColors();
  }

  for (Jardim j : jardim) {
    j.display();
  }

  diplayCentral(cmaster.cor);
}

void diplayCentral(color[] c) {
  if (c.length < 3)
    return;

  for (int i = 0; i < 3; ++i) {
    fill(c[i]);
    ellipse((i+0.5)*width/3f, height/2f, dmini, dmini);
  }
}

int lastMillis = 0;
boolean isTime() {
  if (millis() - lastMillis >= delayms) {
    lastMillis = millis();
    return true;
  }
  return false;
}