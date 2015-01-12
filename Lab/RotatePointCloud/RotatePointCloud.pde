//Load PeasyCam Lib
import peasy.*;
//Declare the class
PeasyCam myCam;

int[] x = new int [100];
int[] y = new int [100];
int[] z = new int [100];

void setup () {
  size(500, 400, P3D);
  noFill();
  stroke(255);

  for (int i = 0; i<100; i++) {
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
  box(300);
  for (int i = 0; i<100; i++) {
    point(x[i], y[i], z[i]);
  }
}

