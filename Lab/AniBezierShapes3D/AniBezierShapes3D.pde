import shapes3d.utils.*;
//import shapes3d.animation.*;
//import shapes3d.*;
 
PVector[] points;
Bezier2D bezier;
 
float t = 0; 
float ct; 
float deltaT = 0.005;
 
void setup() {
  size(600, 600);
  points = new PVector[] {
    new PVector(40, 560),
    new PVector(60, 80),
    new PVector(200, 40),
    new PVector(320, 410),
    new PVector(400, 20),
  };
  bezier = new Bezier2D(points, points.length);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  strokeWeight(3);
}
 
void draw() {
  background(255);
  PVector last = points[0], next;
  for (float ct = 0; ct < t; ct += deltaT) {
    next = bezier.point(ct);
    line(last.x, last.y, next.x, next.y);
    last = next;
  }
  t += deltaT;
  if (t > 1)
    t = 0;
}
