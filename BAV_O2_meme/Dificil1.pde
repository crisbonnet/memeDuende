class Dificil1 {
  Duende duende;
  Llaves [] llaves;
  PImage fondo, contador;
  float posyFondo;
  int cant, choques;
 

  Dificil1() {
    duende = new Duende();
    fondo = loadImage("fondo00.png");
    posyFondo = -600;
    cant = 1;
    choques = 0;
   llaves = new Llaves[cant];
    for (int i=0; i<cant; i++) {
      llaves[i] = new Llaves(200 + i* 400, -200 ); 
      
      contador = loadImage("contador2.png");
    llaves[i].posxLlave= random(200,600);
    llaves[i].posyLlave= -4200;
  }
  }

  void dibujar() {
    image(fondo, 0, posyFondo);
    image(contador,width-135, 0);
    if (posyFondo<1200 ) {
      posyFondo ++;
    }
    if (posyFondo>0) {
      posyFondo = -600;
    }

    textSize(30);
    fill(0);
    text (choques, 750, 85);
    text ("dificil1", 70,150);
    duende.dibujarDuende();
    duende.moverDuende();
   for (int i=0; i<cant; i++) {
      llaves[i].dibujarLlaves();
      llaves[i].moverLlaves();
      
    }
  }

  

  void contadorChoques() {
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
