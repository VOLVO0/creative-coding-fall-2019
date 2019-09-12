void setup() {
  size(600, 600);
}

void draw() {
  for (int x = 0; x < width; x++) {
    float d = dist(x, mouseY, mouseX, mouseY);
    float c = random(d);
    stroke(c, 50, 100);
    line(x, 0, x, height);
  }
}
