import SimpleOpenNI.*;
import peasy.*;

PeasyCam cam;

SimpleOpenNI context;
float        zoomF =0.3f;
float        rotX = radians(180);  // by default rotate the hole scene 180deg around the x-axis, 
// the data from openni comes upside down
float        rotY = radians(0);
PShape       pointCloud;
int          steps = 2;
boolean record = false;


void setup()
{
  size(1024, 768, OPENGL);

  //context = new SimpleOpenNI(this,SimpleOpenNI.RUN_MODE_MULTI_THREADED);
  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // disable mirror
  context.setMirror(false);

  // enable depthMap generation 
  context.enableDepth();
  // enable RGBMap generation
  context.enableRGB();

  // align depth data to image data
  context.alternativeViewPointDepthToImage();
  context.setDepthColorSyncEnabled(true);

  //init peasycam
  //cam = new PeasyCam(this, 500, 400, 0, 400);
  cam = new PeasyCam(this, 500, 400, 0, 400);
}

void draw()
{
  //save to file
  if ( record == true ) saveFrame("/home/jdates/dev/sketchbook/renders/v01/output.###.jpg");

  // update the cam
  context.update();

  PImage  rgbImage = context.rgbImage();
  int[]   depthMap = context.depthMap();
  int     steps   = 4;  // to speed up the drawing, draw every third point
  int     index;
  PVector realWorldPoint;
  color   pixelColor;
  
  background(0);
  //translate(width/2, height/2, 300);
  translate(width/2, height/2, 300); 
  rotateX(rotX);
  rotateY(rotY);
  scale(zoomF);
  strokeWeight((float)steps/2);
  perspective(radians(40), float(width)/float(height), 10, 600); //cam angle,w,h,near,far
 

  PVector[] realWorldMap = context.depthMapRealWorld();
  beginShape(POINTS);
  for (int y=0; y < context.depthHeight (); y+=steps)
  {
    for (int x=0; x < context.depthWidth (); x+=steps)
    {
      index = x + y * context.depthWidth();
      if (depthMap[index] > 0)
      { 
        // get the color of the point
        pixelColor = rgbImage.pixels[index];
        stroke(pixelColor);

        // draw the projected point
        realWorldPoint = realWorldMap[index];
        vertex(realWorldPoint.x, realWorldPoint.y, realWorldPoint.z);  // make realworld z negative, in the 3d drawing coordsystem +z points in the direction of the eye
      }
    }
  } 
  endShape();

  // draw the kinect cam
  //context.drawCamFrustum();
}




void keyPressed() {
  if ( keyPressed ) {
    switch(keyCode)
    {
    case TAB:    //if TAB is pressed set record true, if not, set it to false.
      if ( !record ) {
        record = true;
      } else {
        record = false;
      }
      break;
    case LEFT:
      rotY += 0.1f;
      break;
    case RIGHT:
      // zoom out
      rotY -= 0.1f;
      break;
    case UP:
      if (keyEvent.isShiftDown())
        zoomF += 0.02f;
      else
        rotX += 0.1f;
      break;
    case DOWN:
      if (keyEvent.isShiftDown())
      {
        zoomF -= 0.02f;
        if (zoomF < 0.01)
          zoomF = 0.01;
      } else
        rotX -= 0.1f;
      break;
    }
  }
}

