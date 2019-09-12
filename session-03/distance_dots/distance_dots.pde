
void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  stroke(255);
  
  int step_size = 20;
  int steps = width / step_size;
  
  for (int y = 0; y < steps; y++) {
    for (int x = 0; x < steps; x++) {
      int cx = x * step_size + (step_size/2);
      int cy = y * step_size + (step_size/2);
      float d = dist(mouseX, mouseY, cx, cy);
      float w = map(d, 0, width * 1.5, 3, 32);
      strokeWeight(w);
      point(cx, cy);
    }
  }
}
