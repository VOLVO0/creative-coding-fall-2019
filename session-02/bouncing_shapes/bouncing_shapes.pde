
float x, y;
float dx = 8;
float dy;
float gravity = 0.1;

void setup() {
  size(600, 600);
  stroke(40, 10, 200);
  strokeWeight(4);
  fill(255);
  dx = 5;
  x = 0;
  dy = 0;
  y = height/2;
}
 
float w = 60;
float h = w * 1.618; 

void draw() {
  // background(0);
  rect(x, y, w, h);
  x = x + dx;
  y = y + dy;
  
  dy = dy + gravity;
  
  if ((x + w) > width  || x < 0) {
    dx = -dx;
  }
  
  if ((y + h) > height || y < 0) {
    dy = -dy;
  }
}
