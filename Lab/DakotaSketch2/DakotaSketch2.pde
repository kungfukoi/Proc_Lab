import processing.core.*;

  public void setup (){
    size(400,400);
    background(255);
  }
  
  public void draw() {
    stroke(0);
    if (mousePressed) {
      line(mouseX,mouseY,pmouseX,pmouseY);
  }
}

