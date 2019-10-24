/**
 * Follow 3  
 * based on code from Keith Peters. 
 * 
 * A segmented line follows the mouse. The relative angle from
 * each segment to the next is calculated with atan2() and the
 * position of the next is calculated with sin() and cos().
 */

float[] x = new float[5];
float[] y = new float[5];
float segLength = 20;

float px, py;

void setup() {
  size(1200, 800);
  px = random(width);
  py = random(height);
}


void draw() {
  background(0);
  dragSegment(0, mouseX, mouseY);
  for (int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
  
  fill(200, 0, 0);
  ellipse(px, py, 10, 10);
  
  if (dist(mouseX, mouseY, px, py) < 6) {
    x = append(x, 0);
    y = append(y, 0);
    
    px = random(width);
    py = random(height);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);

  fill(0, 200, 0);  
  strokeWeight(9);
  stroke(0, 200, 0, 80);
  ellipse(0, 0, 40, 40);

  popMatrix();
}


// float[] x = new float[5];\
void mousePressed() {
  x = append(x, 0);
  y = append(y, 0);
}
