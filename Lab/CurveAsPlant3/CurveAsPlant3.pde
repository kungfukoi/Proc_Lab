import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

//Load PeasyCam Lib
import peasy.*;

PeasyCam myCam;

//How many Curves
int amount = 15;

// An array of Bezier curves
P_Bezier3D[] bcurves;

float t = 0;
float ct;
float deltaT = 0.0005;


void setup () {
  size(500, 400, P3D);
  noFill();
  stroke(0, 155, 0);

  //Inititalize myCam
  //PeasyCam(PApplet, lookAtX,lookAtY,lookAtZ, distance)
  myCam = new PeasyCam(this, width/2, height/2, 0, 600);

  // Create Bezier curves
  bcurves = new P_Bezier3D[amount];
  for (int i = 0; i < amount; i++)
    bcurves[i] = createBezier3D();
}

void draw() {
  background(75);
  translate(width/2, height/2);
  rotateY(frameCount / 100.0 );

  translate(0,150);
  box(20);
  
  
  
  
  
 
  // draw the curves
  strokeWeight(1);
  translate(0,-150);

  for (int i =0; i< amount; i++) {
    PVector last = bcurves[i].point(0), next;
    for (float ct = 0; ct < t; ct += deltaT) {
      next = bcurves[i].point(ct);
      line(last.x, last.y, last.z, next.x, next.y, next.z);
      last = next;
    }
    // Update t
    t += deltaT;
    if (t > 1)
      t = 1;
  }
}


// Method to create and return a 3D Bezier curve
P_Bezier3D createBezier3D() {
  PVector[] points = new PVector[] {
    new PVector(0, 150, 0), 
    new PVector(0, -150, 0), 
    new PVector(random(-150, 150), random(-150, 150), random(-150, 150)), 
    new PVector(random(-150, 150), random(-150, 150), random(-150, 150)),
  };
  return new P_Bezier3D(points, points.length);
}

