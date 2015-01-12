import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

//Load PeasyCam Lib
import peasy.*;

PeasyCam myCam;

//How many Curves
int amount = 5;

PVector[] points;
Bezier2D bezier;

float t = 0; 
float ct; 
float deltaT = 0.002;

void setup () {
  size(500, 400, P3D);
  noFill();
  stroke(0, 155, 0);

  //Inititalize myCam
  //PeasyCam(PApplet, lookAtX,lookAtY,lookAtZ, distance)
  myCam = new PeasyCam(this, width/2, height/2, 0, 600);


  points = new PVector[] {
    new PVector(0, 150, 0), 
    new PVector(0, -150, 0), 
    new PVector(random(-150, 150), random(-150, 150), random(-150, 150)), 
    new PVector(random(-150, 150), random(-150, 150), random(-150, 150)),
  };
  bezier = new Bezier2D(points, points.length);
}


void draw() {

  background(75);
  translate(width/2, height/2);
  //rotateY(frameCount / 100.0 );
  strokeWeight(1);
  box(300);


  for (int i =0; i< amount; i++) {
    PVector last = points[0], next;
    for (float ct = 0; ct < t; ct += deltaT) {
      next = bezier.point(ct);
      line(last.x, last.y, next.x, next.y);
      last = next;
    }
    t += deltaT;
    if (t > 1)
      t = 1;
  }
}

