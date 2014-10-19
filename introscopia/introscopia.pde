int qtde = 500, l = 25;
float[][] star = new float[qtde][2];
float teta = 0;
boolean over = false;

PVector pos = new PVector(0, 350), g = new PVector(0, 0.05), vel = new PVector(3.5, -5);

void setup() {
  size(700, 500);
  colorMode(HSB, 255);

  for (int i = 0; i < qtde; i++) {
    star[i][0] = random(width);
    star[i][1] = random(height);
  }
}
void draw() {

  color c = color(175, 100, (pos.x <= width/2)?int(map(pos.x, 0, width, 80, 5)):int(map(pos.x, 0, width, 5, 80)));
  background(c);

  vel.add(g);
  pos.add(vel);

  if (over) {
    fill(c);
    ellipse(pos.x, pos.y, 2*l, 2*l);
    stroke((pos.x < width/2)?int(map(pos.x, 0, width, 200, 255)):int(map(pos.x, 0, width, 255, 200)));
    for (int i = 0; i < qtde; i++) point(star[i][0], star[i][1]);
    translate(pos.x, pos.y); 
    rotate(PI/6f);
    noFill();
    ellipse(2*l*cos(teta), 0, 10, 10);

    teta -= PI/60f;
  } else {
    pushMatrix();
    noFill();
    translate(pos.x, pos.y);
    rotate(PI/6f);
    ellipse(2*l*cos(teta), 0, 10, 10);
    popMatrix();
    fill(c);
    ellipse(pos.x, pos.y, 2*l, 2*l);
    stroke((pos.x < width/2)?int(map(pos.x, 0, width, 200, 255)):int(map(pos.x, 0, width, 255, 200)));
    for (int i = 0; i < qtde; i++) point(star[i][0], star[i][1]);
    teta += PI/60f;
  }
  if (teta > PI) {
    over = true;
  } else if (teta < 0) {
    over = false;
  }

  if (pos.x > width) {  
    vel.set(3.5, -5);
    pos.set(0, height - 150);
  }
}
