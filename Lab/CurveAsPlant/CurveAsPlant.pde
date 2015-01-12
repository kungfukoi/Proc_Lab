//Load PeasyCam Lib
import peasy.*;
//Declare the class
PeasyCam myCam;
int amount = 50;
int[] x = new int [amount];
int[] y = new int [amount];
int[] z = new int [amount];

void setup () {
  size(500, 400, P3D);
  noFill();
  stroke(0,155,0);


//populate the points
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

  background(75);
  translate(width/2, height/2);
  rotateY(frameCount / 100.0 );
  strokeWeight(1);
  box(300);

//bezier(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)
  for (int i = 0; i< amount; i++) {
    bezier(0,150,0,  0,-150,0,     x[i],y[i],z[i],   x[i],y[i],z[i]);
  }
}

