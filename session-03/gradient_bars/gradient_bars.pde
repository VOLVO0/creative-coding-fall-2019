void setup() {
  size(600, 600);
}

void draw() {
  for (int counter=0; counter < width; counter++) {
    // check horizontal distance between line and cursor
    float d = dist(counter, mouseY, mouseX, mouseY);
    float c = random(d);
    // set red value based on cursor distance
    stroke(c, 70, 100);
    // draw line
    line(c, 0, counter, height);  // x, y, x2, y2
  }
}
