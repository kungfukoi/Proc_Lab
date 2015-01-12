//Load PeasyCam Lib
import peasy.*;
//Declare the class
PeasyCam myCam;

void setup(){
  size(600,600,P3D);
  
  
//Inititalize
//PeasyCam(PApplet, lookAtX,lookAtY,lookAtZ, distance)
  myCam = new PeasyCam(this,600);  
}


void draw(){
  background(0);
  
  stroke(255);
  noFill();
  box(300);
}
