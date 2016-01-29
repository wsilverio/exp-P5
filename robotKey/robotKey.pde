import java.awt.*;
import java.awt.event.KeyEvent;
import controlP5.*;

Robot robot;
ControlP5 cp5;
CheckBox checkbox;

String keys = "1234567890-=qwertyuiop'[asdfghjklç~]\\zxcvbnm,.;/";

int[] keysInput = {
  KeyEvent.VK_1, KeyEvent.VK_2, KeyEvent.VK_3, KeyEvent.VK_4, KeyEvent.VK_5, KeyEvent.VK_6, KeyEvent.VK_7, KeyEvent.VK_8, KeyEvent.VK_9, KeyEvent.VK_0, KeyEvent.VK_MINUS, KeyEvent.VK_EQUALS, 
  KeyEvent.VK_Q, KeyEvent.VK_W, KeyEvent.VK_E, KeyEvent.VK_R, KeyEvent.VK_T, KeyEvent.VK_Y, KeyEvent.VK_U, KeyEvent.VK_I, KeyEvent.VK_O, KeyEvent.VK_P, KeyEvent.VK_DEAD_ACUTE, KeyEvent.VK_OPEN_BRACKET, 
  KeyEvent.VK_A, KeyEvent.VK_S, KeyEvent.VK_D, KeyEvent.VK_F, KeyEvent.VK_G, KeyEvent.VK_H, KeyEvent.VK_J, KeyEvent.VK_K, KeyEvent.VK_L, 'ç', KeyEvent.VK_DEAD_TILDE, KeyEvent.VK_CLOSE_BRACKET, 
  KeyEvent.VK_BACK_SLASH, KeyEvent.VK_Z, KeyEvent.VK_X, KeyEvent.VK_C, KeyEvent.VK_V, KeyEvent.VK_B, KeyEvent.VK_N, KeyEvent.VK_M, KeyEvent.VK_COMMA, '.', KeyEvent.VK_SEMICOLON, '/' //KeyEvent.VK_SLASH
};

void setup() {
  size(460, 175);
  smooth();

  try { 
    robot = new Robot();
    robot.setAutoDelay(0);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }

  cp5 = new ControlP5(this);

  int itemSize = 20, itemsPerRow = 12;
  int xPosition = 25, yPosition = 25;
  int spacingRow = 10, spacingCol = 15;

  checkbox = cp5.addCheckBox("checkBox")
    .setPosition(xPosition, yPosition)
    .setSize(itemSize, itemSize)
    .setItemsPerRow(itemsPerRow)
    .setSpacingColumn(spacingCol)
    .setSpacingRow(spacingRow);

  for (int i = 0; i < keys.length(); i++)
    checkbox.addItem(str(keys.charAt(i)), 0);

  //checkbox.getItem(keys.indexOf('ç')).setLabel("c");
  checkbox.getItem(keys.indexOf('ç')).hide();
  checkbox.getItem(keys.indexOf('/')).hide();

  cp5.addButton("reset")
    .setSize(5*itemSize+4*spacingCol, itemSize)
    .setPosition(xPosition+3*itemSize+3*spacingCol, yPosition+4*(itemSize+spacingRow));

  background(150);
}
void draw() {
  float[] values = checkbox.getArrayValue();

  for (int i = 0; i < values.length; i++) {
    if (i == keys.indexOf('ç') || i == keys.indexOf('/'))
      continue;

    if (values[i] > 0) 
      robot.keyPress(keysInput[i]);
    else 
    robot.keyRelease(keysInput[i]);
  }
}

public void reset(int theValue) {
  checkbox.deactivateAll();
}

void keyPressed() {
  if (key == ' ') {
    reset(' ');
  } else {
    println("*** "+(key)+" ***");
  }
}