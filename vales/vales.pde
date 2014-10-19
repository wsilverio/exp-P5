float t = 0;
void setup() {
  size(700, 400);
  strokeWeight(2);

  noiseDetail(5);
  stroke(150);

  background(#F1E17F);
}
void draw() {
  fill(#F1E17F, 50);
  rect(-2, -2, width + 2, height + 2);
 
  t += 0.05;

  pushMatrix();  
  translate(0, height/2 - height*noise(t));

  fill(#012542);
  beginShape();
  for (int x = 0; x <= width; x+= 3) {
    vertex(width-x, height*noise(t - x*0.01));
  }

  popMatrix();
  vertex(0, height);
  vertex(width, height);
  endShape(CLOSE);
}
void mouseReleased() {
  saveFrame("vales.png");
}

