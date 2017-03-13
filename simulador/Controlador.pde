class Controlador {
  boolean master;
  int leds;
  color[] cor;

  Controlador(boolean is_master, int l) {
    master = is_master;
    leds = l;

    cor = new color[l];
    for (int i = 0; i < cor.length; ++i) {
      cor[i] = color(0);
    }
  }
}