int x1 = 10;
int y1 = 10;

int x2 = 100;
int y2 = 20;

float interpolate = 0;

int startTime;
int growTime = 1000;//1s

void setup()
{
  size(200, 200);
  int startTime = millis();
}

void draw()
{
  background(0);
  stroke(255);
  
  interpolate = (float)(millis()-startTime)/growTime;
  if(interpolate < 1)
  {
    line(x1, y1, 
     (int)( (1-interpolate)*x1 + interpolate*x2 ),
     (int)( (1-interpolate)*y1 + interpolate*y2 ) );     
  } 
  else
  {
    startTime = millis();
  }
}
