class Facil2 {
  Duende duende;
  Llaves [] llaves;
  Llaves [] llavesExtra;
  PImage fondo, contador;
  float posy;
  int cant, choques;
  

  Facil2() {
    duende = new Duende();
    fondo = loadImage("fondo00.png");
    posy = -600;
    cant = 2;
    choques = 0;
    llaves = new Llaves[cant];
    llavesExtra = new Llaves[cant];
    
    for (int i=0; i<cant; i++) {
      llaves[i] = new Llaves(150 + i* 400, -500 );
        llavesExtra[i] = new Llaves(100 + i* 400, -1000 ); 
      contador = loadImage("contador2.png");
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
    text ("facil2", 70,150);
    duende.dibujarDuende();
    duende.moverDuende();
    for (int i=0; i<cant; i++) {
      llaves[i].dibujarLlaves();
      llaves[i].moverLlaves();
      llavesExtra[i].dibujarLlaves();
      llavesExtra[i].moverLlaves();
    }
  }

  

  void contadorChoques2() {
    for (int i=0; i<cant; i++) {
      boolean choque = (dist(duende.posxDuende, duende.posyDuende, llaves[i].posxLlave, llaves[i].posyLlave)<100) ||
      (dist(duende.posxDuende, duende.posyDuende, llavesExtra[i].posxLlave, llavesExtra[i].posyLlave)<100)== true;

      if ((choque && llaves[i].colisiona) || (choque && llavesExtra[i].colisiona)) {
        choques ++;
        agarraLlave.trigger();
        duende.duendeAgarraLlaves();
        llaves[i].colisiona = false;
        llavesExtra[i].colisiona = false;
      }
    }
  }
}
