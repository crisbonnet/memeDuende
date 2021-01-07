class Boton {
  int botonX, botonY, botonTam; 
   String texto;
 
  Boton(int botonX_, int botonY_, int botonTam_) {
    botonX = botonX_;
    botonY = botonY_;
    botonTam = botonTam_;
    
  }
  
  void dibujar(){
  noStroke();
    fill(255, 2);
    ellipse(botonX, botonY, botonTam, botonTam/2);
    fill(0);    
  }
  
  
  boolean botonPress(int botonX_, int botonY_, int botonTam_) { 
    botonX = botonX_;
    botonY = botonY_;
    botonTam = botonTam_;
  float distancia= dist (mouseX, mouseY, botonX, botonY); 
  
    boolean presionado= distancia<botonTam/2 ==true;
      return presionado;}
    }
