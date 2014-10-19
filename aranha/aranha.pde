float t, x, y;
void setup() { 
  size(700, 300); 
  x = random(100, width - 100);
  y = random(100, height - 100);
} 
void draw() { 
  background(255);

  x += random(-2, 2);
  y += random(-2, 2);

  x = constrain(x, 10, width - 10);
  y = constrain(y, 10, height - 10);

  for (int i = 10; i < width; i += 10) for (int j = 10; j < height; j += 10) { 
    point(i + random(-1, 1), j + random(-1, 1)); 
    float d = dist(x, y, i, j);
    if (d <= 20 && d >= 10) line(x, y, i, j);
  }
}

