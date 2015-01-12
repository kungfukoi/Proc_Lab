PShape s;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
 
void setup()  { 
  size(500, 500, P3D);  
  s = loadShape("teapot.obj");
}

void draw()  { 
  background(0);
  lights();

  pushMatrix(); 
  translate(width/2, height/2, -30); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  rotateX(-ymag); 
  rotateY(-xmag);
  scale(50);
  shape(s);
  popMatrix();
}
