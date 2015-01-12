//Load PeasyCam Lib
import peasy.*;
//Declare the class
PeasyCam myCam;
int amount = 500;
int[] x = new int [amount];
int[] y = new int [amount];
int[] z = new int [amount];

void setup () {
  size(500, 400, P3D);
  background(0);
  noFill();
  stroke(255);



  for (int i = 0; i< amount; i++) {
    x[i] = int(random(-150, 150));
    y[i] = int(random(-150, 150));
    z[i] = int(random(-150, 150));
  }
  //Inititalize myCam
  //PeasyCam(PApplet, lookAtX,lookAtY,lookAtZ, distance)
  myCam = new PeasyCam(this, width/2, height/2, 0, 600);
}
void draw() {

  background(0);
  translate(width/2, height/2);
  rotateY(frameCount / 100.0 );
  strokeWeight(1);
  box(300);

  for (int i = 0; i< amount; i++) {
    point(x[i], y[i], z[i]);
  }
}
