class Dificil2 {
  Duende duende;
  Llaves [] llaves;
  PImage fondo, contador;
  float posy;
  int cant, choques;


  Dificil2() {
    duende = new Duende();
    fondo = loadImage("fondo00.png");
    posy = -600;
    cant = 1;
    choques = 0;
    llaves = new Llaves[cant];
    for (int i=0; i<cant; i++) {
      llaves[i] = new Llaves(200 + i* 400, -500 ); 
      contador = loadImage("contador2.png");
      llaves[i].posxLlave= random(200,600);
    llaves[i].posyLlave= -4200;
    }
  }

  void dibujar() {
    image(fondo, 0, posy);
    image(contador, width-135, 0);
    if (posy<1200 ) {
      posy ++;
    }
    if (posy>0) {
      posy = -600;
    }

    textSize(30);
    fill(0);
    text (choques, 750, 85);
    text ("dificil2", 70,150);
    duende.dibujarDuende();
    duende.moverDuende();
    for (int i=0; i<cant; i++) {
      llaves[i].dibujarLlaves();
      llaves[i].moverLlaves();
    }
  }

  

  void contadorChoques2() {
    for (int i=0; i<cant; i++) {
      boolean choque = dist(duende.posxDuende, duende.posyDuende, llaves[i].posxLlave, llaves[i].posyLlave)<100 == true;

      if (choque && llaves[i].colisiona) {
        choques ++;
        agarraLlave.trigger();
        duende.duendeAgarraLlaves();
        llaves[i].colisiona = false;
      }
    }
  }
}
