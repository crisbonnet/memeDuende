  import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim moneda;
Minim ambiente;

AudioPlayer musAmb;
AudioSample agarraLlave;

Historia historia;

void setup() {
  size(800, 600);
  
  historia= new Historia();
  
  moneda  = new Minim(this);
  agarraLlave = moneda.loadSample("moneda.wav", 512);
  
  ambiente  = new Minim(this);
  musAmb = ambiente.loadFile("ambiente.mp3", 2048);
  musAmb.play();
  musAmb.loop();
}
void draw() {
  historia.dibujarPant();
  
}
void mousePressed() {
  historia.botones();
}
