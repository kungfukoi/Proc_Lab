import processing.opengl.*;
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.Box;
import shapes3d.*;

// define box
Box box;

//Load PeasyCam Lib
import peasy.*;
PeasyCam myCam;

//How many Curves
int amount = 15;

// An array of Bezier curves
P_Bezier3D[] bcurves;

// initialize vars for Bezier Growth
float t = 0;
float ct;
float deltaT = 0;

// initalize vars for 3D Picking
Shape3D picked = null;
boolean clicked = false;

void setup () {
  size(500, 400, OPENGL);
  noFill();
  stroke(0, 155, 0);

  //initialize box
  box = new Box(this);
  box.fill(color(0));
  box.stroke(color(75));
  box.strokeWeight(2);
  box.setSize(40, 40, 40);
  box.drawMode(S3D.SOLID | S3D.WIRE);

  //Inititalize myCam
  //PeasyCam(PApplet, lookAtX,lookAtY,lookAtZ, distance)
  myCam = new PeasyCam(this, 0, 0, 0, 400);

  // Create Bezier curves
  bcurves = new P_Bezier3D[amount];
  for (int i = 0; i < amount; i++)
    bcurves[i] = createBezier3D();
}

void draw() {
  background(75);
  //translate(width/2, height/2);
  //rotateY(frameCount / 100.0 );

  //draw box
  pushMatrix();
  box.moveTo(0, 150, 0);
  box.draw();
  popMatrix();


  //turn white if clicked
  if (clicked) {
    clicked = false;
    picked = Shape3D.pickShape(this, mouseX, mouseY);
    if (picked !=null) {
      picked.fill(color(255));
      deltaT = 0.0005;
    }
  }

  // draw the curves
  //strokeWeight(1);
  if (deltaT > 0) {
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


void mouseClicked() {
  clicked = true;
}

