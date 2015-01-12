PVector a1, a2, c1, c2;

void setup() {
  size(400, 400);
  background(255);

  a1 = new PVector(0, random(height));
  a2 = new PVector(width, random(height));
  c1 = new PVector(width/2, a1.y);
  c2 = new PVector(width/2, a2.y);

  strokeWeight(3);
  stroke(255, 0, 0);

  int steps = 60;
  // Stroke weight variables
  float s0 = 3, s1 = 12, s = s0;
  float ds = (s1 - s0)/steps;
  // Parametric variables
  float dt = 1.0 / steps;
  float t = dt;
  // Initial poistion
  float px = a1.x;
  float py = a1.y;
  for (int i = 1; i <= steps; i++) {
    float x = bezierPoint(a1.x, c1.x, c2.x, a2.x, t);
    float y = bezierPoint(a1.y, c1.y, c2.y, a2.y, t);
    strokeWeight(s);
    line(px, py, x, y);
    px = x;
    py = y;
    s += ds; // Change stroke
    t += dt; // next parametric value
  }
}

