//size(800, 800);

void setup() {
  size(800, 800);
  fill(#000000);
}

int x = 400;
int dx = 10;

void draw() {
  background(#ffffff);

  int size = 20;
  
  //      x    y 
  ellipse(x, 400, size, size);
  ellipse(200, x, size, size);
  rect(0, 400, x, size);
  rect(400, 0, size, x);
  
  ellipse((frameCount * 3) % width, 200, size, size);
  
  textSize(48);
  text(x, 10, 50);
  
  x = x + dx;
  
  //if x is too big or x is too small
  //  go the other way
  if (x > 800 || x < 0) {
    dx = -dx;
  }
  
  
}
