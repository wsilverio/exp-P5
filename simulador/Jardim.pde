class Jardim {

  Controlador[] controlador; // [0]: int, [1]: ext

  final int leds = 8;
  float px, py, raio, diam;

  Jardim(float x, float y, float d) {
    px = x;
    py = y;
    diam = d;
    raio = d/2f;

    controlador = new Controlador[2];
    for (int i = 0; i < controlador.length; ++i) {
      controlador[i] = new Controlador(false, leds);
    }
  }

  void display() {
    float[] x = {0.55*raio, 0.9*raio};

    fill(0);    
    ellipse(px, py, diam, diam);

    pushMatrix();
    translate(px, py);
    for (int j = 0; j < 2; ++j) { 
      for (int i = 0; i < leds; ++i) {
        float phi = i*TWO_PI/leds;
        fill(controlador[j].cor[i]);
        ellipse(x[j]*cos(phi), x[j]*sin(phi), dmini, dmini);
      }
    }
    popMatrix();
  }
}