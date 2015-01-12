// interpolate between two points
float x1;
float y1;

float x2;
float y2;

// you want to generate equal spacing between them defined by a paremeter:
int step;

void setup(){

    size (600, 400); // set up window size
    background (255);  // define background color
    smooth(); // define the render to be smooth (anti-alias)

    x1 = 100;
    y1 = 100;
   
    x2 = width-100;
    y2 = height-100;
   
    step = 30;
   
}

void draw(){
      background(255);
     
      x1 = mouseX;
      y1 = mouseY;

      strokeWeight(10);
      stroke(255,0,0); // n1
      point(x1,y1);
    
      stroke(0,255,0); // n2
      point (x2, y2);
    
      fill(0,0,0);
      noStroke();
      // calculto do Interpolante
      // t is a control parameter that varies between 0 and 1
    
      // the loop goes from o to 1, so the increment parameter has to be scaled
      // 10 / step is the correct increment for the desired number of interpolations
      float stepSize = 10.0/ step;
      for ( float t = 0; t<= 10;  t = t + stepSize)
      {
     
                // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
                float x = x1 + (t*0.1) *(x2 - x1);
                float y = y1 + (t*0.1) *(y2 - y1);
                // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
            
                ellipse ( x,y, 5,5);
              
           
      }

}
