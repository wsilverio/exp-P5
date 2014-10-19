void setup() {
  size(400, 400);
  rectMode(CENTER);
}
void draw() {
  background(#F4D9CE);

  cursor(HAND);

  stroke(#BF9E98);
  line(width/2+10, 300+10, width/2-15, 300-15);
  line(width/2, 300, width/2+15, 300-15);

  fill(#EC8E9A);
  noStroke();
  if (dist(mouseX, mouseY, 142, 85) <= 30 || dist(mouseX, mouseY, width-142, 85) <= 30) {
    noCursor();
    ellipse(142 + random(-3, 3), 85 + random(-3, 3), 12, 12);
    ellipse(width-142 + random(-3, 3), 85 + random(-3, 3), 12, 12);
  } else {
    ellipse(142, 85, 12, 12);
    ellipse(width-142, 85, 12, 12);
  }
  noFill();  
  if (dist(mouseX, mouseY, width/2, 300) <= 20) {
    stroke(0);
    noCursor();
    for (int n = 0; n <= 50; n++) ellipse(width/2 + random(-25, 25), 300 + random(-30, 15), 10, 10);
  }

  stroke(#BF9E98);
  ellipse(width/2, 230, 6, 10);

  beginShape();
  vertex(115.0, 88.0);
  bezierVertex(115.0, 88.0, 115.0, 88.0, 115.0, 88.0);
  bezierVertex(115.0, 88.0, 145.0, 134.5822, 182.0, 88.99111);
  endShape();

  beginShape();
  vertex(width- 115.0, 88.0);
  bezierVertex(width- 115.0, 88.0, width- 115.0, 88.0, width- 115.0, 88.0);
  bezierVertex(width- 115.0, 88.0, width- 145.0, 134.5822, width- 182.0, 88.99111);
  endShape();

  beginShape();
  vertex(125.0, 110.0);
  bezierVertex(125.0, 110.0, 125.0, 110.0, 125.0, 110.0);
  bezierVertex(125.0, 110.0, 152.0, 192.0, 125.0, 269.0);
  endShape();

  beginShape();
  vertex(width-125.0, 110.0);
  bezierVertex(width-125.0, 110.0, width-125.0, 110.0, width-125.0, 110.0);
  bezierVertex(width-125.0, 110.0, width-152.0, 192.0, width-125.0, 269.0);
  endShape();
}

