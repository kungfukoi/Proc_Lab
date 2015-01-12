PVector t1, t2, t3;
float s ;
PVector p1, p2, p3;

ArrayList<PVector> points = new ArrayList<PVector>();


void setup() {
  size(400, 400, P2D);
  p1 = new PVector(0, 0);
  p2 = new PVector(-120, 200);
  p3 = new PVector(100, 230);
  smooth(8);
  strokeWeight(1.7);
}

void draw() {
  background(255);
  translate(width/2, height/8);
  noStroke();
  fill(200, 250, 250);
  ellipse(p1.x, p1.y, 10, 10);
  ellipse(p2.x, p2.y, 10, 10);
  ellipse(p3.x, p3.y, 10, 10);

  if (s<=1) {
    s+=0.002;
    t1 = PVector.lerp(p1, p2, s);
    t2 = PVector.lerp(p2, p3, s);
    t3 = PVector.lerp(t1, t2, s);
    points.add(t3);
  } else {
    t1.set(0f, 0f);
    t2.set(0f, 0f);
    s= 0f;
    points.clear();
  }


  noFill();
  strokeWeight(1.7);
  stroke(0, 0, 200);

  for (PVector p : points) {
    point(p.x, p.y);
  }

  strokeWeight(1);
  stroke(200);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p2.x, p2.y, p3.x, p3.y);

  stroke(140, 150, 150);
  line(t1.x, t1.y, t2.x, t2.y);


  noStroke();
  fill(200, 50, 50);
  ellipse(t1.x, t1.y, 4, 4);
  ellipse(t2.x, t2.y, 4, 4);
  ellipse(t3.x, t3.y, 6, 6);
}

