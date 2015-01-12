void setup(){
  size(500, 400);
   background(255);
   frameRate(120);
}

void draw(){
    
 
  stroke(0);
  fill(0);
  //ellipse(250,200, 100, 100);
  
  if (mousePressed && (mouseButton == LEFT)) {
      ellipse(mouseX,mouseY,10,10);
  } else if (mousePressed && (mouseButton == RIGHT)) {
      background(255);
  } else {
  }
}
