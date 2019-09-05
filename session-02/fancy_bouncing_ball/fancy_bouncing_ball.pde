int b = 0; // bounce
int step = 2;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  // bouncing
  b = b + step;
  if (b > width || b < 0) {
    step = -step;
  }
  
  //      x, y, w, h 
  ellipse(b, height/2 + 40, 20, 20);
}
