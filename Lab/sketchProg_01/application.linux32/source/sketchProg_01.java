import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketchProg_01 extends PApplet {

public void setup(){
  size(500, 400);
   background(255);
}

public void draw(){
    
 
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "sketchProg_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
