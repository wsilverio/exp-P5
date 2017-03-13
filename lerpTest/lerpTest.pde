import controlP5.*;

ControlP5 cp5;

int from_H = 0;
int from_S = 100;
int from_B = 100;

int to_H = 180;
int to_S = 100;
int to_B = 100;

int amt = 5;

CheckBox checkbox;

void setup() {
  size(260, 200);

  colorMode(HSB, 360, 100, 100);

  cp5 = new ControlP5(this);

  cp5.addSlider("from_H")
    .setPosition(30, 10)
    .setRange(0, 360)
    ;

  cp5.addSlider("from_S")
    .setPosition(30, 25)
    .setRange(0, 100)
    ;

  cp5.addSlider("from_B")
    .setPosition(30, 40)
    .setRange(0, 100)
    ;


  cp5.addSlider("to_H")
    .setPosition(30, 70)
    .setRange(0, 360)
    ;

  cp5.addSlider("to_S")
    .setPosition(30, 85)
    .setRange(0, 100)
    ;

  cp5.addSlider("to_B")
    .setPosition(30, 100)
    .setRange(0, 100)
    ;

  checkbox = cp5.addCheckBox("#inverter")
    .setPosition(30, 130)
    .setSize(13, 13)
    .addItem("inverter", 0)
    ;

  cp5.addSlider("amt")
    .setPosition(30, 155)
    .setRange(0, 9)
    .setNumberOfTickMarks(10)
    ;

  background(0);

  for (int y = 15; y <= 165; ++y) {
    stroke(lerpColor(color(0, 100, 100), color(359, 100, 100), y/float(165-15-1)));
    line(230, y, 250, y);
  }

  noStroke();
}
void draw() {

  color from = color(from_H, from_S, from_B);
  color to = color(to_H, to_S, to_B);

  fill(from);
  rect(180, 15, 30, 30);
  fill(to);
  rect(180, 75, 30, 30);

  boolean inverter = (checkbox.getItem(0).getValue()>0)?true:false;

  if (inverter) {
    fill(lerpColor(to, from, amt/9f));
  } else {
    fill(lerpColor(from, to, amt/9f));
  }
  rect(180, 135, 30, 30);

  for (int i = 0; i < 9; ++i) {
    if (inverter) {
      fill(lerpColor(to, from, i/8f));
    } else {
      fill(lerpColor(from, to, i/8f));
    }
    rect(i*22+18, 180, 20, 10);
  }
}