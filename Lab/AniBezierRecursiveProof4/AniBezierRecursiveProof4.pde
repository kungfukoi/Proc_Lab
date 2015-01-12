import java.util.*;
 
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<PVector> curve = new ArrayList<PVector>();
 
float t = 0, deltaT = 0.005;
 
int[] colors = new  int[20];
 
void setup() {
  size(600, 600);
  initColors();
  points.add(new PVector(40, 560));
  points.add(new PVector(60, 80));
  points.add(new PVector(200, 40));
  points.add(new PVector(320, 410));
  points.add(new PVector(400, 20));
}
 
void draw() {
  background(50);
  smooth(8);
  PVector p = constructBezier(t, points, 0);
  curve.add(p);
  drawBezier(curve, p);
  t += deltaT;
  if (t > 1) {
    curve.clear();
    t = 0;
  }
}
 
// Draw the curve as its constructed
void drawBezier(ArrayList<PVector> c, PVector last) {
  fill(255, 0, 0);
  stroke(255, 0, 0);
  strokeWeight(3);
  if (c.size() > 0) {
    PVector c0 = c.get(0), c1;
    for (int i = 1; i < c.size (); i++) {
      c1 = c.get(i);
      line(c0.x, c0.y, c1.x, c1.y);
      c0 = c1;
    }
  }
  ellipse(last.x, last.y, 10, 10);
}
 
// Recursive function
PVector constructBezier( float t, ArrayList<PVector> points, int c ) {
  PVector p0, p1;
  fill(colors[c]);
  stroke(colors[c]);
  p0 = points.get(0);
  p1 = points.get(1);   
  if (points.size() == 2)
    return getPointAtT(p0, p1, t);
  ArrayList<PVector> next = new ArrayList<PVector>();
  for (int i = 1; i < points.size (); i++) {
    p1 = points.get(i);
    next.add(getPointAtT(p0, p1, t));
    p0 = p1;
  }
  return constructBezier(t, next, (c+1)% colors.length);
}
 
// Draw the link between two points and return the next point
PVector getPointAtT(PVector p0, PVector p1, float t) {
  strokeWeight(2);
  ellipse(p0.x, p0.y, 8, 8);
  line(p0.x, p0.y, p1.x, p1.y);
  ellipse(p1.x, p1.y, 8, 8);   
  PVector v = PVector.sub(p1, p0);
  v.mult(t);
  v.add(p0);
  return v;
}
 
// Create a different colour for each iteration
void initColors() {
  colorMode(HSB, 1.0, 1.0, 1.0);
  for (int i = 0; i < colors.length; i++) {
    colors[i] = color( ((i + 1)*0.19) % 1.0, 1, 0.9);
  }
  colorMode(RGB, 255);
}
