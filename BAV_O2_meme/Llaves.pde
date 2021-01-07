class Llaves {
  PImage llave;
  float posxLlave, posyLlave, vel, direccion;
  boolean colisiona;
  
  Llaves(float posxLlave_, float posyLlave_){
  llave = loadImage("llave.png");
  posxLlave = posxLlave_;
  posyLlave = posyLlave_;
  direccion = random(-2,-4);
  vel = direccion;
  colisiona = true;
  }
  
  void dibujarLlaves(){
  image(llave,posxLlave,posyLlave);
  }
  
  void moverLlaves(){
    if(posyLlave>height){
      posyLlave = -800;
      colisiona = true;
    }
    posyLlave -= direccion*-vel;
  }
}
