void setup() {
  size(600, 600);
}

void draw() {
  for (int counter=0; counter < width; counter++) {
    // check horizontal distance between line and cursor
    float d = dist(counter, mouseY, mouseX, mouseY);
    // set red value based on cursor distance
    stroke(d, 70, 100);
    // draw line
    line(counter, 0, counter, height);  // x, y, x2, y2
  }
}
