class Historia {
  String estado;
  PImage []pantalla= new PImage[9];
  PImage contador;
  int tiempo;


  Boton botInicio, botFelicidad, botSuerte, botAmor, botPoder, botTienda3A, botTienda3B, botReinicio, botContinuar;
  Facil1 facil1;
  Facil2 facil2;
  Facil3 facil3;

  Dificil1 dificil1;
  Dificil2 dificil2;
  Dificil3 dificil3;
  Duende duende;

  Historia () {
    facil1 = new Facil1();
    facil2 = new Facil2();
    facil3 = new Facil3();

    dificil1= new Dificil1();
    dificil2= new Dificil2();
    dificil3= new Dificil3();

    duende = new Duende();

    estado = "inicio"; 

    for (int i=0; i<9; i++) {
      pantalla[i] = loadImage("pantalla"+ i +".png");
      contador = loadImage("contador2.png");
    }


    botInicio = new Boton(width/2, height/2, width);

    botFelicidad = new Boton(160, 350, 280);
    botSuerte = new Boton(640, 350, 280);

    botAmor = new Boton(160, 350, 280);
    botPoder = new Boton(640, 350, 280);

    botTienda3A = new Boton(160, 350, 280);
    botTienda3B = new Boton(640, 350, 280);

    botReinicio= new Boton(width/2, height/2, width);
    botContinuar= new Boton(width/2, 530, 200);
  }



  void dibujarPant() {

    if (estado.equals("inicio")) {
      image(pantalla[0], 0, 0);
    } else if (estado.equals("facil1")) {
      cronometro();
      facil1.dibujar();
      facil1.contadorChoques();
      text(tiempo, 700, 85);

      if (facil1.choques == 5) {
        estado = "primeratienda";
      }
    } else if (estado.equals("primeratienda")) { //primera tienda dificultad fácil
      image(pantalla[1], 0, 0);
      image(contador, width-135, 0);
      text (facil1.choques, 725, 85);
      botFelicidad.dibujar();
      botSuerte.dibujar();
      
      tiempo=0;
    } else if (estado.equals("facil2")) {
      cronometro();
      facil2.dibujar();
      facil2.contadorChoques2();
      text(tiempo, 700,85);

      if (facil2.choques == 5) {
        estado = "segundatienda";
      }
    } else if (estado.equals("segundatienda")) { //segunda tienda dificultad fácil
      image(pantalla[2], 0, 0);
      image(contador, width-135, 0);
      text (facil2.choques, 725, 85);
      botAmor.dibujar();
      botPoder.dibujar();
      tiempo=0;
    } else if (estado.equals("facil3")) {
      cronometro();
      facil3.dibujar();
      facil3.contadorChoques3();
      text(tiempo, 700,85);

      if (facil3.choques == 5) {
        estado = "terceratienda";
      }
    } else if (estado.equals("terceratienda")) { //tercera tienda dificultad fácil
      image(pantalla[3], 0, 0);
      image(contador, width-135, 0);
      text (facil3.choques, 725, 85);
      botTienda3A.dibujar();
      botTienda3B.dibujar();
      tiempo=0;
    } else if (estado.equals("ganar")) { 
      image(pantalla[7], 0, 0);
      botReinicio.dibujar();
    }

    //-----------------------------------------------------DIFICIL---------------------------------------------
    if (estado.equals("dificil1")) {
      cronometro();
      dificil1.dibujar();
      dificil1.contadorChoques();
      text(tiempo, 700,85);

      if (tiempo==30) {
        estado = "primeratiendaD";
      }
    } else if (estado.equals("primeratiendaD")) { //primera tienda dificultad dificil
      image(pantalla[4], 0, 0);
      image(contador, width-135, 0);
      text (dificil1.choques, 725, 85);
      botContinuar.dibujar();
    
      tiempo=0;
    } else if (estado.equals("dificil2")) {
      cronometro();
      dificil2.dibujar();
      dificil2.contadorChoques2();
      text(tiempo, 700,85);

      if (tiempo==30) {
        estado = "segundatiendaD";
      }
    } else if (estado.equals("segundatiendaD")) { //segunda tienda dificultad dificil
      image(pantalla[5], 0, 0);
       image(contador, width-135, 0);
      text (dificil2.choques, 725, 85);
      botContinuar.dibujar();
     
      tiempo=0;
    } else if (estado.equals("dificil3")) {
      cronometro();
      dificil3.dibujar();
      dificil3.contadorChoques3();
      text(tiempo, 700,85);

      if (tiempo==30) {
        estado = "terceratiendaD";
      }
    } else if (estado.equals("terceratiendaD")) { //tercera tienda dificultad dificil
      image(pantalla[6], 0, 0);
       image(contador, width-135, 0);
      text (dificil3.choques, 725, 85);
      botContinuar.dibujar();
     
      tiempo=0;
    } else if (estado.equals("perder")) { 
      image(pantalla[8], 0, 0);
      botReinicio.dibujar();
    }
  }


  //botones facil
  void botones() {
    if (botInicio.botonPress(width/2, height/2, width) && estado.equals("inicio") && frameCount%2==0) {
      estado = "facil1";
    } else if ((botFelicidad.botonPress (180, 300, 350) || botSuerte.botonPress (620, 300, 350))  && estado.equals("primeratienda")) {
      estado = "facil2";
    } else if ((botAmor.botonPress (180, 300, 350) || botPoder.botonPress (620, 300, 350))  && estado.equals("segundatienda")) {
      estado = "facil3";
    } else if ((botTienda3A.botonPress (180, 300, 350) || botTienda3B.botonPress (620, 300, 350))  && estado.equals("terceratienda")) {
      estado = "ganar";
    }


    //botones dificil
    if (botInicio.botonPress(width/2, height/2, width) && estado.equals("inicio") && frameCount%2!=0) {
      estado = "dificil1";
    } else if (botContinuar.botonPress (width/2,  530, 200)  && estado.equals("primeratiendaD")) {
      estado = "dificil2";
    } else if (botContinuar.botonPress (width/2,  530, 200)  && estado.equals("segundatiendaD")) {
      estado = "dificil3";
    } else if (botContinuar.botonPress (width/2,  530, 200)  && estado.equals("terceratiendaD")) {
      estado = "perder";
    } 


    if (botReinicio.botonPress(width/2, height/2, width) && estado.equals("ganar")) {
      estado = "inicio";
      setup();
    }
    if (botReinicio.botonPress(width/2, height/2, width) && estado.equals("perder")) {
      estado = "inicio";
      setup();
    }
  }
  //pasar metodo contadorChoques

  void cronometro() {
    if (frameCount%60==0) {
      tiempo++;
    }
  }
}
