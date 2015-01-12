PVector t1, t2, t3;
PVector p0, p1, p2;
float s;


ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(600, 600, P2D);

  int startTime = millis();

  p0 = new PVector(200, 550);
  p1 = new PVector(200, 50);
  p2 = new PVector(400, 50);


  smooth(8);
  strokeWeight(1.7);
  //frameRate(24);
}

void draw() {
  background(0);

  //p0
  stroke(0, 155, 0);
  fill(0, 155, 0);
  ellipse(p0.x, p0.y, 10, 10);

  //p1
  stroke(0, 155, 0);
  fill(0, 155, 0);
  ellipse(p1.x, p1.y, 10, 10);

  //p2
  stroke(0, 155, 0);
  fill(0, 155, 0);
  ellipse(p2.x, p2.y, 10, 10);


  if (s<=1) {
    s+=0.002;
    t1 = PVector.lerp(p0, p1, s);
    t2 = PVector.lerp(p1, p2, s);
    t3 = PVector.lerp(t1, t2, s);
    points.add(t3);
  } else {
    //t1.set(0f, 0f);
    s= 0f;
    points.clear();
  }

  //t1, t2, t3
  noStroke();
  fill(200, 50, 50);
  ellipse(t1.x, t1.y, 10, 10);
  ellipse(t2.x, t2.y, 10, 10);
  ellipse(t3.x, t3.y, 10, 10);

  //the growing line
  noFill();
  strokeWeight(5);
  stroke(0, 0, 200);


   for (PVector p : points) {
   point(p.x, p.y);
   }

}

