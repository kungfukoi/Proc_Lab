boolean record = false;

void draw() {
  fill((color) random(#000000));
  rect(width>>2, height>>2, width>>1, height>>1);
  if (record == true ) saveFrame(dataPath("/home/jdates/dev/sketchbook/renders/v02/###.jpg"));
}

void keyPressed() {
  if ( key == TAB ) {
    if ( !record ) {
      record = true;
    } else {
      record = false;
    }
  }
}

