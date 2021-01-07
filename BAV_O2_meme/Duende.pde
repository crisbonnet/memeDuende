// CLASE DUENDE
class Duende {
  float posxDuende, posyDuende;
  PImage []duendeSprite= new PImage[4];
  PImage duende;
  int tamxDuende, tamyDuende;
  int num=0;
  PImage [] duendeUp =new PImage [2];
  int numUp =0;
  //String calles;

  Duende() {
    for (int i = 0 ; i<4 ; i++){
     duendeSprite [i] = loadImage("duende" + i + ".png");
    }

    posxDuende = mouseX;
    posyDuende = height/2;
    tamxDuende = 133;
    tamyDuende = 150;
    
    for (int i = 0 ; i<2 ; i++){
    duendeUp [i]=loadImage("duendeUp" + i + ".png");
    }
  }
  
  
  void dibujarDuende() {

     image(duendeSprite [num], posxDuende, posyDuende, tamxDuende, tamyDuende);
     
     if(frameCount%10==0){
  if(num<3){
  num++;}
  else{
    num=0;}   
}
    }
    
  
  void moverDuende(){
  posxDuende = mouseX;
  }
  
  
  void duendeAgarraLlaves(){  
    image(duendeUp[numUp], posxDuende, posyDuende, tamxDuende, tamyDuende);
    
    if(frameCount%10==0){
  if(numUp<1){
  numUp++;}
  else{
    numUp=0;}   
  }
}
}
