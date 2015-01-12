PVector t1, t2, t3, t4, t5, t6;
float s ;
PVector p1, p2, p3, p4;
 
ArrayList<PVector> points = new ArrayList<PVector>();
 
 
void setup() {
  size(600, 600, P2D);
  p1 = new PVector(0, 0);
  p2 = new PVector(-120, 200);
  p3 = new PVector(100, 230);
  p4 = new PVector(200, 135);
  smooth(8);
  strokeWeight(1.7);
}
 
void draw() {
  background(100);
  translate(width/2, height/2);
  noStroke();
  fill(200, 250, 250);
  ellipse(p1.x, p1.y, 10, 10);
  ellipse(p2.x, p2.y, 10, 10);
  ellipse(p3.x, p3.y, 10, 10);
  ellipse(p4.x, p4.y, 10, 10);
 
  if (s<=1) {
    s+=0.002;
    t1 = PVector.lerp(p1, p2, s);
    t2 = PVector.lerp(p2, p3, s);
    t3 = PVector.lerp(t1, t2, s);
    t4 = PVector.lerp(p3, p4, s);
    t5 = PVector.lerp(t2, t4, s);
    t6 = PVector.lerp(t3, t5, s);
    points.add(t6);
  } else {
    t1.set(0f, 0f);
    t2.set(0f, 0f);
    t3.set(0f, 0f);
    s= 0f;
    points.clear();
    p2 = PVector.random2D();
    p2.mult(random(100, 280));
 
    p3 = PVector.random2D();
    p3.mult(random(100, 280));
 
    p4 = PVector.random2D();
    p4.mult(random(100, 280));
  }
 
 
  strokeWeight(1);
  stroke(200);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p2.x, p2.y, p3.x, p3.y);
  line(p3.x, p3.y, p4.x, p4.y);
 
  stroke(140, 150, 150);
  line(t1.x, t1.y, t2.x, t2.y);
  line(t2.x, t2.y, t4.x, t4.y);
  line(t3.x, t3.y, t5.x, t5.y);
 
 
  noStroke();
  fill(200, 50, 50);
  ellipse(t1.x, t1.y, 4, 4);
  ellipse(t2.x, t2.y, 4, 4);
  ellipse(t3.x, t3.y, 4, 4);
  ellipse(t4.x, t4.y, 4, 4);
  ellipse(t6.x, t6.y, 7, 7);
  ellipse(t5.x, t5.y, 4, 4);
 
  noFill();
  strokeWeight(1.7);
  stroke(0, 0, 200);
  for (PVector p : points) {
    point(p.x, p.y);//, 4, 4);
  }
}
