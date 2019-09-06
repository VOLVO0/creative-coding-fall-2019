// rectangular (x, y)
// polar       (r, theta)

// convert (r, theta) to (x, y) 
//   x = r * sin(theta) 
//   y = r * cos(theta)
float radius = 80;

void setup() {
  size(400, 400);
  smooth(8);
  stroke(255);
  fill(255);
  background(0);
}

float move = -100;

void draw() {
  //background(0);
  
  move += 3;
  
  float rot = (TWO_PI / 60) * (frameCount % 60.0);
  float cx = move;  // center of rotation
  float cy = height - 70;

  float x, y;
  color c;
  
  // with geometry shifting
  pushMatrix();
  translate(cx, cy);
  rotate(rot);
  x = 0;
  y = radius;
  c = color(255, 100, 100);
  stroke(c);
  fill(c);
  line(0, 0, x, y);
  popMatrix();
  
  // with polar to rectangular calculation
  x = radius * sin(rot) + cx;
  y = radius * cos(rot) + cy;
  c = color(100, 100, 255);
  stroke(c);
  fill(c);
  line(cx, cy, x, y); 
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen.png");  
  }
}
