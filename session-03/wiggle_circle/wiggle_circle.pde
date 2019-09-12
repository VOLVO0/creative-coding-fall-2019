// rectangular (x, y)
// polar       (r, theta)

// convert (r, theta) to (x, y) 
//   x = r * sin(theta) 
//   y = r * cos(theta)

float move = 0;
float magnitude = 80;
float cx, cy;  // center of rotation
color c;

int points = 80; // number of points in the shape
float hue;

void setup() {
  size(1024, 600);
  smooth(8);
  
  background(0);
  cx = width/2;  // center of rotation
  cy = height/2;
  hue = 1;
  
  noFill();
}


void draw() {
  // background(0);
  stroke(30, 20);
  noFill();
  move += 0.2;
  
  float x, y;
  
  beginShape();
  for (int count = 0; count < points + 1; count++) {
    // nudge each point a certain distance outwards 
    float theta = TWO_PI * ((count * 1.0) / points);
    float nudge = magnitude * noise((hue + count) * 0.2, (hue + move) * 0.2);
    
    x = (move + nudge) * sin(theta) + cx;
    y = (move + nudge) * cos(theta) + cy;
    vertex(x, y);
  } 
  endShape();
  
  if (move > width * 0.7) {
    move = 0;
    hue = (hue + 7) % 360;
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen.png");  
  }
}
