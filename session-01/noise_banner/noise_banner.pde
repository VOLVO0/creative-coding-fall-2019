void setup() {
  size(1024, 768);
  colorMode(HSB);
  noFill();
}

void draw() {
  background(0x11);
  int t = frameCount;
  for (int n=0; n < width; n++) {
    stroke(color((n * 0.1) % 360, 100, 100, 200));
    float w = noise(n * 0.02) * 30;
    float h = noise(t * 0.01, n * 0.02);
    ellipse(n, height, w, h * height);
  }
  // saveFrame(String.format("anim-%03d.png", frameCount));  
  // if (frameCount > (24 * 3)) exit();
}
