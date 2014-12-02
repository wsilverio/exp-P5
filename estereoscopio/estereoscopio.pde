//Esfero b[] = new Esfero(5); 

PGraphics red, cia;

int dx, dy;

PVector pos, vel, g;

void setup() {
  size(displayWidth, displayHeight);
  noCursor();

  red = createGraphics(130, 100);
  red.beginDraw();
  red.noStroke();
  red.background(0, 0);
  red.fill(255, 0, 0);
  red.ellipse(red.width/2, red.height/2, 100, 100);
  red.endDraw();

  cia = createGraphics(130, 100);
  cia.beginDraw();
  cia.noStroke();
  cia.background(0, 0);
  cia.fill(0, 255, 255);
  cia.ellipse(cia.width/2, cia.height/2, 100, 100);
  cia.endDraw();

  pos = new PVector(random(0, width - cia.width/2), random(0, height - cia.height/2));
  vel = new PVector(random(5, 10), random(5, 10));
  g = new PVector(0, 1);
}
boolean sketchFullScreen() {
  return true;
}
void draw() {
  background(255);
  //image(red, width/2, height/2);
  //image(cia, width/2, height/2);

  vel.add(g);
  pos.add(vel);

  if (pos.x < cia.width/2 || pos.x > width - cia.width/2) {
    vel.x = -vel.x;
    pos.x = constrain(pos.x, cia.width/2, width - cia.width/2);
  }
  if (pos.y < cia.height/2 || pos.y > height - cia.height/2) {
    vel.mult(0.95);
    vel.y = -vel.y;
    pos.y = constrain(pos.y, cia.height/2, height - cia.height/2);
  }

  dx = (int) pos.x - cia.width/2;
  dy = (int) pos.y - cia.height/2;
  blend(cia, 0, 0, cia.width, cia.height, dx, dy, cia.width, cia.height, MULTIPLY);
  blend(red, 0, 0, cia.width, cia.height, dx + 10, dy, cia.width, cia.height, MULTIPLY);

  blend(cia, 0, 0, cia.width, cia.height, width - (dx + cia.width), height - (dy + cia.height), cia.width, cia.height, MULTIPLY);
  blend(red, 0, 0, cia.width, cia.height, width - (dx - 10 + cia.width), height - (dy + cia.height), cia.width, cia.height, MULTIPLY);
}

/*
class Esfero{
 
 Esfero(){
 
 }
 }
 */
