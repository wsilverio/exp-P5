/*
import android.view.MotionEvent;
 
 import ketai.ui.*;
 KetaiGesture gesture;
 */

void setup() {
  size(320, 480);
  stroke(255);
  strokeWeight(3);

  textSize(24);
  textAlign(CENTER, CENTER);

  //gesture = new KetaiGesture(this);
}
boolean move = false;
int h = 40, select = -1, n = 15;
float ty = h;

void draw() {
  background(#86E0DB);

  fill(250);
  noFill();

  pushMatrix();
  translate(0, ty);
  for (int i = 0; i < n; i++) {
    if (i == select && !move) stroke(0);
    else stroke(255);
    rect(0, h*i, width, h);
    text(i, h/2, h*i + h/2);
  }
  popMatrix();

  fill(0);
  rect(0, 0, width, h);
  rect(0, height - h, width, height);
}
void mouseDragged() {
  move = true;
  if (n > height/h - 2) {
    ty = constrain(ty += mouseY - pmouseY, -(n*h - height + h), h);
  }
}
void mousePressed() {
  move = false;
}
void mouseReleased() {
  if (!move) {
    if (mouseY > h && mouseY <= n*h + h && mouseY < height - h) {
      select = (int)map(mouseY - ty, 0, height, 0, height/h);
      println("Selec: ", select);
    }
  }
}
/*
void onTap(float x, float mouse_y) {
 select = (int)map(mouse_y - ty, 0, height, 0, height/h);
 
 println(select);
 }
 
 public boolean surfaceTouchEvent(MotionEvent event) {
 super.surfaceTouchEvent(event);
 return gesture.surfaceTouchEvent(event);
 }
 */
