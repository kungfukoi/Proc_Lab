PShape s;

void setup(){
  size(500, 500, P3D);
  //the file teapot.obj must be in the data folder
  //of the current sketch to load successfully
  s = loadShape("teapot.obj");
}

void draw(){
  background(204);
  translate(width/2, height/2);
  scale(-50);
  shape(s,0,0);
}
